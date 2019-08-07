class MainController < ApplicationController
  before_action :current_user

  def index
    redirect_to login_path unless @current_user
  end
end
