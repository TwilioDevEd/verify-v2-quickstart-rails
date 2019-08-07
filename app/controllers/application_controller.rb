class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user = nil
    if session[:user_id]
      begin
        @current_user ||= User.find(session[:user_id])
      rescue ActiveRecord::RecordNotFound
      end
    else
    end
  end
end
