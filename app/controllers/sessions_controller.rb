class SessionsController < ApplicationController
  skip_before_action :user_require_login, only: [:new, :create]

  def new
    @form = Forms::LoginForm.new
  end

  def create
    @form = Forms::LoginForm.new(session_params)

    render :new and return unless @form.valid?

    if user = @form.authenticate
      session[:current_user_id] = user.user_id

      #TODO: ログイン成功時のリダイレクト先を後から設定すること
      redirect_to root_path
    else
      render :new
    end
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
end
