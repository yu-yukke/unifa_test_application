class Forms::LoginForm
  include ActiveModel::Model

  attr_accessor :user_id, :password

  with_options presence: true do
    validates :user_id
    validates :password
  end
end
