class UserMailer < ActionMailer::Base
    default from: "zhangyuelinchina@gmail.com"
    
    def registration_confirmation(user)
        @user = user
        mail(:to => @user.email, 
             :subject => "Please confirm your registration")
    end
=begin
    def registration_confirmation(user)
        @user = user
        mg_client = Mailgun::Client.new ENV['api_key']
        message_params = {
            :from    => ENV['gmail_username'],
            :to      => @user.email,
            :subject => "Registration Confirmation"
        }
        mg_client.send_message ENV['domain'], message_params

    end
=end
=begin
    def send_simple_message
        RestClient.post "https://api:key-d7a4a6fd7ff306798971052bea1f7404",
        "@api.mailgun.net/v3/sandbox4d9bc4cc1eca48cca63f5adc85a2b8d5.mailgun.org/messages",
        :from => "Mailgun Sandbox <postmaster@sandbox4d9bc4cc1eca48cca63f5adc85a2b8d5.mailgun.org>",
        :to => "Yuelin Zhang <zhangyuelinchina@gmail.com>",
        :subject => "Hello Yuelin Zhang",
        :text => "Congratulations Yuelin Zhang, you just sent an email with Mailgun!  You are truly awesome!"
    end
=end
end