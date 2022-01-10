class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # skip_before_action :verify_authenticity_token
  protect_from_forgery prepend: true, with: :exception

  before_action :get_original_user, :set_subdomain

  layout :set_layout

  include PublicActivity::StoreController

  def get_original_user
    @original_user_scope_identifier = session[:original_user_scope_identifier]
  end

  def set_subdomain
    @subdomain = ""
    unless request.subdomain.blank?
      @subdomain = request.subdomain
    end
  end

  private
    def set_layout
      folder = 'votes/'
      module_name = self.class.to_s.split("::").first

      if module_name.eql?("Devise")
        return "devise/layouts"
      else
        if request.subdomain && request.subdomain != ''
          case request.subdomain
          when 'admin'
            folder = 'admin/'
          when 'me'
            folder = 'me/'
          else
            folder = 'intranet/'
          end
        end

        return "#{folder}layouts/application"
      end

    end

end
