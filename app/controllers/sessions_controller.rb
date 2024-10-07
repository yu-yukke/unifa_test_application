class SessionsController < ApplicationController
  skip_before_action :user_require_login, only: [:new, :create]
  before_action :user_logged_in?, only: [:new, :create]

  def new
    @form = Forms::LoginForm.new
  end

  def create
    @form = Forms::LoginForm.new(session_params)

    render :new and return unless @form.valid?

    if user = @form.authenticate
      log_in(user)

      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    log_out

    redirect_to new_session_path
  end

  private

  def session_params
    params
      .require(:forms_login_form)
      .permit(
        :user_id,
        :password
      )
  end

  def user_logged_in?
    return unless logged_in?

    redirect_to posts_path
  end
end
