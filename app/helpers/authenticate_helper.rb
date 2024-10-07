module AuthenticateHelper
  def authenticated?
    session[:access_token].present?
  end

  def oauth_authenticate_url
    callback_url = Rails.application.credentials.my_tweet_app[:callback_url]
    query = {
      client_id: Rails.application.credentials.my_tweet_app[:client_id],
      redirect_uri: Rails.application.credentials.my_tweet_app[:redirect_uri],
      response_type: 'code',
      scope: 'write_tweet',
    }

    uri = URI.parse(callback_url)
    uri.query = URI.encode_www_form(query)
    uri.to_s
  end
end
