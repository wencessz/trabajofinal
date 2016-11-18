class CommunicateMailer < ApplicationMailer
  default from: 'notifications@wences.com'

  def send_aviso_message(communicate)
    @sender = User.find(communicate.sender_id)
    @publisher = User.find(communicate.publisher_id)
    @aviso = Aviso.find(communicate.aviso_id)
    @message = communicate.message

    @url  = 'http://example.com/login'
    subject = "#{@sender.name} te mando un mensaje"
    mail(to: @publisher.email, subject: subject)
  end
end
