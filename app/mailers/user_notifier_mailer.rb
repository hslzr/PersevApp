class UserNotifierMailer < ApplicationMailer
  default from: 'noreply@persevapp.com'

  def send_welcome_email(user)
    @user = user
    mail(
      to: user.email,
      subject: '¡Bienvenido a PersevApp')
  end
end
