require 'net/http'
require 'uri'

class Oauth::CallbacksController < ApplicationController
  def index
    code = params[:code]
    response = post_authorization(code)
    access_token = JSON.parse(response.body)['access_token']

    authorize(access_token) if response.code == '200'

    redirect_to posts_path
  end

  private

  def post_authorization(code)
    uri = URI.parse(oauth_token_url)
    body = oauth_token_query(code)
    response = Net::HTTP.post_form(uri, body)

    response
  end
end
