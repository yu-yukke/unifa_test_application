class Oauth::CallbacksController < ApplicationController
  require 'net/http'
  require 'uri'

  def index
    code = params[:code]
    response = post_authorization(code)
    access_token = JSON.parse(response.body)['access_token']

    authenticate(access_token) if response.code == '200'

    redirect_to posts_path
  end

  private

  def post_authorization(code)
    uri = URI.parse(oauth_token_url)
    query = oauth_token_query(code)
    response = Net::HTTP.post_form(uri, query)

    response
  end
end
