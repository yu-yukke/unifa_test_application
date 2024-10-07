module AuthorizationHelper
  def authorized?
    session[:access_token].present?
  end

  def authorize(access_token)
    session[:access_token] = access_token
  end

  def oauth_authorize_url
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

  def oauth_token_url
    token_url = Rails.application.credentials.my_tweet_app[:token_url]

    uri = URI.parse(token_url)
    uri.to_s
  end

  def oauth_token_query(code)
    query = {
      client_id: Rails.application.credentials.my_tweet_app[:client_id],
      client_secret: Rails.application.credentials.my_tweet_app[:client_secret],
      redirect_uri: Rails.application.credentials.my_tweet_app[:redirect_uri],
      grant_type: 'authorization_code',
      code: code,
    }

    query
  end
end
