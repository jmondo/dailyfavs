class UsersController < ApplicationController
  before_filter :authenticate_user!

  def edit
    user
  end

  def update
    user
    @user.update_attributes(params[:user])
    redirect_to root_path, notice: "You have successfully updated your email address."
  end

  protected

  def user
    @user ||= User.find_by_nickname(params[:id])
  end

  def authenticate_user!
    if user != current_user
      redirect_to root_path, alert: "Access Denied. Please sign in to the correct account to edit this profile."
    end
  end
end
