class Forms::CreatePostForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :title, :string
  attribute :image
  attribute :current_user

  with_options presence: true do
    validates :title, length: { maximum: 30 }
    validates :image # ActiveStorageのバリデーションは標準で存在しないためForm内でチェックする
    validates :current_user
  end

  def save
    return false unless valid?

    post = current_user.posts.build(title:, image:)
    post.save
  end
end
