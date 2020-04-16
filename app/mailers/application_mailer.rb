class ApplicationMailer < ActionMailer::Base
  default from: 'laurent.barbezieux@gmail.com'
  layout 'mailer'

  def contact_message(contact)
    @contact = contact
    mail(:from => @contact.email, :to => "laurent.barbezieux@gmail.com", :subject => @contact.message)
  end

end
