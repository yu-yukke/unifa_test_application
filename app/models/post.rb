class Post < ApplicationRecord
  belongs_to :user_account

  validates :title, presence: true
end
