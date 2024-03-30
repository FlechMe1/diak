class User < ActiveRecord::Base
  require 'digest/md5'
  include PublicActivity::Model
  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :omniauthable, :recoverable, :rememberable, :trackable, :validatable,
         :validate_on_invite => true, omniauth_providers: [:google_oauth2]

  has_many :memberships, as: :member
  has_many :associations, through: :memberships, source: :structure
  has_many :churches, through: :memberships, source: :structure
  has_many :roles, through: :memberships

  has_one_attached :avatar

  validates :firstname, :lastname, presence: true

  scope :enabled, -> { where.not(disabled: true) }
  scope :disabled, -> { where(disabled: true) }


  before_validation :clean_name_attributes

  def clean_name_attributes
    self.lastname  = lastname.to_s.strip.upcase
    self.firstname = firstname.to_s.strip.titlecase
  end

  def application_roles
    memberships.where(structure_id: nil).map(&:role).map(&:name)
  end

  def fullname
    "#{firstname} #{lastname}"
  end

  alias name fullname

  def full_address
    result = ""
    unless address_1.blank?
      result = address_1 + "<br>"
    end
    unless address_2.blank?
      result = result + address_2 + "<br>"
    end
    unless zipcode.blank?
      result = result + zipcode
    end
    unless town.blank?
      result = result + " " + town
    end
    result.html_safe
  end

  def inline_address
    result = ""
    unless address_1.blank?
      result = address_1 + " "
    end
    unless address_2.blank?
      result = result + address_2 + " "
    end
    unless zipcode.blank?
      result = result + ' - ' + zipcode
    end
    unless town.blank?
      result = result + " " + town
    end
    result.html_safe
  end

  def friendly_id
    sprintf '%05d', id
  end

  def self.global_search q
    where(['(firstname LIKE ? OR lastname LIKE ? OR email LIKE ? OR id LIKE ?)', "#{q}%", "#{q}%", "#{q}%", "#{q}%"])
  end

  def has_role?(role_name, structure = nil)
    if structure.blank?
      return !self.roles.where(name: role_name).blank?
    end

    if self.memberships.joins(:role).where('roles.name IN (?)', role_name).pluck(:structure_id).include?(structure.id)
      return true
    end

    return false
  end

  def has_any_role?(*roles_name)
    self.memberships.joins(:role).where('roles.name IN (?)', roles_name).count > 0
  end

  def add_role role_name, structure = nil, can_vote = true, reason = nil
    # Crée un rôle seul (Valable sur l'ensemble de l'APP)
    # OU Avec une Class (Valable uniquement sur cette Class)
    # OU Avec une resource (Valable que pour cette resource)

    role = Role.find_or_create_by(name: role_name)
    Membership.find_or_create_by(role: role, member: self, structure: structure, can_vote: can_vote, reason: reason)

    role
  end

  def remove_role role_name, structure = nil
    role       = Role.find_or_create_by(name: role_name)
    membership = self.memberships.where(role: role, structure: structure).first

    membership.destroy

    role
  end

  def structures
    Structure.where(id: (associations + churches))
  end

  def get_presidences
    role= Role.where(name: :president).first
    Structure.select('*', 'type AS type').where(id: self.memberships.where(role_id: role.id).pluck(:structure_id)) if role
  end

  def church_presidences
    role = Role.where(name: :president).first
    Structure.where(id: self.memberships.where(role_id: role.id, resource_type: 'Church').pluck(:resource_id))
  end

  def associations_responsabilities
    Structure.joins(memberships: :role)
             .where(type: 'Association')
             .where(roles: { name: %w[president secretary treasurer director] })
             .where(memberships: { member_type: 'User', member_id: self.id })
  end

  def get_class
    User.to_s
  end

  def is_elector?(structure)
    elector = electors.find_by(structure: structure)
    elector && elector.can_vote
  end

  def is_admin?
    has_role? :admin
  end

  def can_switch?
    has_role? [:admin, :moderator]
  end

  def has_voted?(campaign)
    structure = Structure.find(campaign.structure_id)

    campaign.has_already_vote?(self)
  end

  def self.prepare_import(upload)
    keys = []

    CSV.foreach(File.open(upload.file.current_path), headers: false) do |row|
      if upload.has_heading
        row.each do |k|
          keys << k
        end
      else
        row.each_with_index do |k, index|
          keys << "col-#{index}"
        end
      end
      break
    end
    keys
  end

  def eligible_campaign_ids
    campaigns = Campaign.currents
    presidences = get_presidences
    campaign_ids = []

    campaigns.each do |campaign|
      presidences.each_with_index do |s, index|
        if campaign.structure.is_member?(s)
          if campaign.structure.member_can_vote?(s) && !campaign.has_already_vote?(s)
            campaign_ids << campaign.id
            break
          elsif !campaign.structure.member_can_vote?(s)
            campaign_ids << campaign.id
            break
          end
        elsif campaign.structure_can_vote?(s, false) && !campaign.has_already_vote?(s)
          campaign_ids << campaign.id
          break
        end
      end

      if campaign.structure.is_member?(self)
        if campaign.structure.member_can_vote?(self) && campaign.user_can_vote?(self) && !campaign.has_already_vote?(self)
          campaign_ids << campaign.id
        elsif !campaign.structure.member_can_vote?(self)
          campaign_ids << campaign.id
        end
      elsif campaign.user_can_vote?(self, false) && !campaign.has_already_vote?(self)
        campaign_ids << campaign.id
      end
    end

    campaign_ids
  end

  def self.get_import_fields
    [
      ['ID', :id],
      ['NOM', :firstname],
      ['PRENOM', :lastname],
      ['EMAIL', :email],
      ['PORTABLE', :phone_1],
      ['FIXE', :phone_2],
      ['ADRESSE', :address_1],
      ['CODE POSTAL', :zipcode],
      ['VILLE', :town],
      ['DATE DE NAISSANCE', :birthday],
      ['RECONNAISSANCE', :level]
    ]
  end

  def can_vote
    true
  end

  def self.accept_invitation!(attributes = {})
    invitable = find_by(invitation_token: attributes[:invitation_token])
    if invitable.errors.empty?
      invitable.assign_attributes(attributes)
      invitable.accept_invitation!
    end
    invitable
  end

  def my_roles
    roles
  end

  def send_invitation_email
    UserMailer.send_direct_access(self).deliver
  end

  def gravatar_url
    hash = Digest::MD5.hexdigest(self.email)

    return "https://www.gravatar.com/avatar/#{hash}"
  end

  def get_avatar_url size = [150, 150]
    "/avatars/#{self.id}.png"
  end

  def current_church
    phase = self.phases.order(start_at: :desc).first
    phase.present? ? phase.church : nil
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    user
  end

  def self.allowed_params params
    if params[:user][:password].blank?
      params[:user].except(:id, :encrypted_password, :sign_in_count, :created_at, :updated_at, :invitations_count, :disabled, :authentication_token)
                  .permit(:firstname, :lastname, :avatar, :address_1,
                           :address_2, :zipcode, :town, :phone_1, :phone_2,
                           :email, :level, :birthdate, :avatar, :biography,
                           husband_marriage_attributes: [:husband_id, :wife_id],
                           wife_marriage_attributes:    [:husband_id, :wife_id],
                           fees_attributes:             [:id, :what, :paid_at, :amount, :_destroy],
                           gratitudes_attributes:       [:id, :level, :referent_id, :start_at, :_destroy],
                           phases_attributes:           [:id, :church_id, :function, :start_at, :end_at, :_destroy],
                           responsabilities_attributes: [:id, :association_id, :function, :start_at, :end_at, :_destroy])
    else
      params[:user].except(:id, :encrypted_password, :sign_in_count, :created_at, :updated_at, :invitations_count, :disabled, :authentication_token)
                  .permit(:firstname, :lastname, :avatar, :address_1,
                           :address_2, :zipcode, :town, :phone_1, :phone_2, :biography,
                           :email, :level, :birthdate, :password, :password_confirmation, :avatar,
                           husband_marriage_attributes: [:husband_id, :wife_id],
                           wife_marriage_attributes:    [:husband_id, :wife_id],
                           fees_attributes:             [:id, :what, :paid_at, :amount, :_destroy],
                           gratitudes_attributes:       [:id, :level, :referent_id, :start_at, :_destroy],
                           phases_attributes:           [:id, :church_id, :function, :start_at, :end_at, :_destroy],
                           responsabilities_attributes: [:id, :association_id, :function, :start_at, :end_at, :_destroy])
    end
  end

end
