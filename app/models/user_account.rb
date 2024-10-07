class UserAccount < ApplicationRecord
  has_secure_password

  with_options presence: true do
    validates :user_id
    validates :password
  end
end
