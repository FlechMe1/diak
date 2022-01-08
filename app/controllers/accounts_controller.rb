class AccountsController < ApplicationController

  before_action :set_user

  def show
    @structures = current_user.structures

    @activities = PublicActivity::Activity.order("created_at desc")
                    .where(owner_id: @user.id, owner_type: "User")
                    .or(PublicActivity::Activity.where(trackable_id: @user.id, trackable_type: 'User'))
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to me_url, flash:{success: 'Votre compte a été mis à jour.'}
     else
      render :edit
    end
  end

  private
    def set_user
      @user = current_user
    end

    def user_params
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
      params[:user].permit(:firstname, :lastname, :avatar, :address_1,
                          :address_2, :zipcode, :town, :phone_1, :phone_2, :biography,
                          :email, :level, :birthdate, :password, :password_confirmation, :avatar,
                          husband_marriage_attributes: [:husband_id, :wife_id],
                          wife_marriage_attributes: [:husband_id, :wife_id],
                          gratitudes_attributes: [:id, :level, :referent_id, :start_at, :_destroy],
                          phases_attributes: [:id, :church_id, :function, :start_at, :end_at, :_destroy],
                          responsabilities_attributes: [:id, :association_id, :function, :start_at, :end_at, :_destroy])
    end

end
