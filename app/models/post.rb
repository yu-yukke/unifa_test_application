class Post < ApplicationRecord
  has_one_attached :image

  belongs_to :user_account

  with_options presence: true do
    validates :title
  end
end
