# app/mailers/test_mailer.rb
class TestMailer < ApplicationMailer

  def test_email
    mail(to: 'wakita.904@gmail.com', subject: 'Test Email', body: 'This is a test email.')
  end
end
