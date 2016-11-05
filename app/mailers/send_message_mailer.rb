class SendMessageMailer < ApplicationMailer
    default from: "test@1kg.fr"
    
    def new_message(message)
    @message = message
    mail(to: @message.user.email, subject: 'Hey! Here is what you missed')
    end
end
