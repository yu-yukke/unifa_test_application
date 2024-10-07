class AuthenticatesController < ApplicationController
  def show
    return redirect_to posts_path if authenticated?

    redirect_to oauth_authenticate_url, allow_other_host: true
  end
end
