if Rails.env.development?
  UserAccount.destroy_all

  UserAccount.create!(
    user_id: 'test_account',
    password: 'password',
    password_confirmation: 'password'
  )
end
