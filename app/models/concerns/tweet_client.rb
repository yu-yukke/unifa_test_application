require 'net/http'
require 'uri'

class TweetClient
  def initialize(post_tweet_url, token)
    @post_tweet_url = post_tweet_url
    @token = token
  end

  def post(post)
    uri = URI.parse(@post_tweet_url)
    http = Net::HTTP.new(uri.host, uri.port)
    headers = {
      "Content-Type" => "application/json",
      "Authorization" => "Bearer #{@token}"
    }
    body = {
      text: post.title,
      url: post_image_url(post.image)
    }
    response = http.post(uri.path, body.to_json, headers)

    response
  end

  private

  def post_image_url(image)
    Rails.application.routes.url_helpers.url_for(image)
  end
end
