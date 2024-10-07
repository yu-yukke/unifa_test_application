class Forms::LoginForm
  include ActiveModel::Model

  attr_accessor :user_id, :password

  with_options presence: true do
    validates :user_id
    validates :password
  end

  # ユーザーIDとパスワードを検証し、一致した場合にユーザー情報を返却する
  def authenticate
    user = UserAccount.find_by(user_id: user_id)
    return user if user && user.authenticate(password)

    errors.add(:base, 'ユーザーIDとパスワードが一致するユーザーが存在しません')
    false
  end
end
