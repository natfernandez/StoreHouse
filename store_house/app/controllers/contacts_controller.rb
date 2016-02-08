class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.save
    redirect_to contacts_url
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update(:params_data)
      redirect_to @contact
    end
  end
end
