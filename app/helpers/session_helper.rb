module SessionHelper
  def current_user
    @current_user ||= UserAccount.find_by(user_id: session[:current_user_id])
  end
end
