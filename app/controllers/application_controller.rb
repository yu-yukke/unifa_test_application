class ApplicationController < ActionController::Base
  include SessionHelper
  include AuthenticateHelper

  before_action :user_require_login

  def user_require_login
    redirect_to new_session_path unless logged_in?
  end
end
