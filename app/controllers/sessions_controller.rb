class SessionsController < ApplicationController
  def new
    @form = Forms::LoginForm.new
  end
end
