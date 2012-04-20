class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= if session[:user_id]
      User.find(session[:user_id])
    end
  end
end
