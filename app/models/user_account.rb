class UserAccount < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy

  with_options presence: true do
    validates :user_id
    validates :password_digest
  end
end
