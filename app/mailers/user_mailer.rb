class UserMailer < ApplicationMailer
    def send_email(user)
        @user = user
        
        mail(:to => user.email,subject: 'Welcome ')
        
      end
end
