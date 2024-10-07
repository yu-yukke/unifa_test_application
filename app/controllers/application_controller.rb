class ApplicationController < ActionController::Base
  include SessionHelper

  def user_require_login
    redirect_to new_session_path unless current_user
  end
end
