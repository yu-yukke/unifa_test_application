class PostsController < ApplicationController
  def index
    @posts = current_user.posts.order(created_at: :desc)
  end

  def new
    @form = Forms::CreatePostForm.new(current_user:)
  end

  def create
    @form = Forms::CreatePostForm.new(create_post_form_params)

    render :new and return unless @form.valid?

    if @form.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def post_params
    params
      .require(:forms_create_post_form)
      .permit(
        :title,
        :image
      )
  end

  def create_post_form_params
    post_params.merge(current_user:)
  end
end
