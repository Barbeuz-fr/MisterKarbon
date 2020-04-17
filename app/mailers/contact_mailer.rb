class ContactMailer < ApplicationMailer

  def contact_message(contact)
    @contact = contact
    mail(:from => @contact.email, :to => "karbonchain@gmail.com", :subject => @contact.message)
  end

end
