class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    if user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome back!"
    else
      user = User.create_with_omniauth(auth)
      session[:user_id] = user.id
      redirect_to edit_user_path(user.nickname), notice: "You are signed up. Please provide your email address where we can send you daily favs."
    end
  end
end
