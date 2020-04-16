class ApplicationMailer < ActionMailer::Base
  default from: 'laurent.barbezieux@gmail.com'
  layout 'mailer'

  def contact_message(contact)
    @contact = contact
    mail( :to => "laurent.barbezieux@gmail.com", :subject => "You Have a Message From Your Website")
  end

end
