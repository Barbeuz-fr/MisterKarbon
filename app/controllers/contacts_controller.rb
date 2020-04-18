class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]
  before_action :sidebar_show

  def new
    @contact = Contact.new
    render :layout => 'home'
  end

  def create
    @contact = Contact.new(contact_params)

    #  ContactMailer - envoi de l'email et notice
    if @contact.save
      ContactMailer.contact_message(@contact).deliver_now
      redirect_to root_path, notice: "Message bien reçu!"
    else
      flash.now[:error] = "Merci de vérifier votre message."
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
