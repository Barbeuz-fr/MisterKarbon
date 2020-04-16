class ContactsController < ApplicationController
  before_action :sidebar_show

  def new
    @contact = Contact.new
    render :layout => 'home'
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      ApplicationMailer.contact_message(@contact).deliver_now
      redirect_to root_path, notice: "Message bien reçu!"
    else
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
