class UserMailerPreview < ApplicationMailer::Preview
    def sample_mail_preview
        UserMailer.sample_mail(User.first)
    end
end