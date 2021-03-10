# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  
  @user = User.create!(
      first_name: 'Emily',
      last_name: 'Lim',
      email: 'em@mail.com',
      password: '12345',
      password_confirmation: '12345'
    )


  UserMailer.order_confirmation(@user, order).deliver_now
end
