class PostsController < ApplicationController
  def index
    @posts = current_user.posts.order(created_at: :desc)
  end

  def new
    @form = Forms::CreatePostForm.new
  end
end
