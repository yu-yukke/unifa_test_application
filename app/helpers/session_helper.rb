module SessionHelper
  def current_user
    @current_user ||= UserAccount.find_by(user_id: session[:current_user_id])
  end

  def log_in(user)
    session[:current_user_id] = user.user_id
  end

  def log_out
    session.delete(:current_user_id)
    @current_user = nil
  end

  def logged_in?
    !!current_user
  end
end
