module PostTweetHelper
  def post_tweet_url
    Rails.application.credentials.my_tweet_app[:post_tweet_url]
  end

  def tweet_client
    @tweet_client ||= TweetClient.new(post_tweet_url, session[:access_token])
  end
end
