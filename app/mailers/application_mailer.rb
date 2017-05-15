class ApplicationMailer < ActionMailer::Base
  default from: 'renlar.jean@gmail.com'
  layout 'mailer'

  def test_email
    recipients = "simon.wietrich@gmail.com"
    mail(to: recipients, subject: 'Demande d\'activation du compte', body: "Coucou")

  end
end
