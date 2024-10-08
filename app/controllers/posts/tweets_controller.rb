class Posts::TweetsController < ApplicationController
  def create
    post = current_user.posts.find_by(id: params[:post_id])
    return redirect_to posts_path unless post

    response = tweet_client.post(post)

    redirect_to posts_path if response.code == '201'
  end
end
