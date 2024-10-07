class UserAccount < ApplicationRecord
  with_options presence: true do
    validates :user_id
    validates :password
  end
end
