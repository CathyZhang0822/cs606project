class UserMailer < ActionMailer::Base
    default from: "zhangyuelinchina@gmail.com"
    
    def registration_confirmation(user)
        @user = user
        mail(:to => @user.email, 
             :subject => "Please confirm your registration")
    end
    
    def password_reset(user)
        @user = user
        mail(:to => @user.email,
             :subject => "Password Reset")
    end

end