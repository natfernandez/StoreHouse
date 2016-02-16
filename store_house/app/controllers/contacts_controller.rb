class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def index
    @contacts = Contact.all
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      render :action => :index
    else
      binding.pry
      flash[:error] =  @contact.errors.messages
      render :action => 'new'
    end
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update_attributes(params[:contact])
      render :action => 'index'
    end
  end

  def show
    @contact = Contact.find(params[:id])
    if @contact.present?
      render :show
    else
      flash[:error] = "Could not show the contact"
      render :action => 'index'
    end
  end
end
