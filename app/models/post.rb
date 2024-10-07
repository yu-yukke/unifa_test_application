class Post < ApplicationRecord
  has_one_attached :image

  belongs_to :user_account

  with_options presence: true do
    validates :title
    validates :image,
              attached: true,
              content_type: %w[image/png image/jpeg]
  end
end
