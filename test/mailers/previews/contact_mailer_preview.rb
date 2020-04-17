# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  def contact_email
    # Set up a temporary order for the preview
    test_email = Contact.new(name: "test", email: "test@gmail.com", message: "testtest")
    ContactMailer.contact_message(test_email)
  end


end
