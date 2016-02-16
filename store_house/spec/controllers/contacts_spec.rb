require 'spec_helper'

RSpec.describe ContactsController, :type => :controller do
  routes { StoreHouse::Application.routes }
  let(:contact) { stub_model(Contact, { id: 18 , name: 'Contact One', tax_number: '12345678F'} ) }

  describe 'GET #index' do
    it 'returns all products' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new contacts controller' do
    it 'creates a new contact instance' do
      get :new
      contact = assigns[:contact]
      expect(contact).to be_present
    end

    it 'render contact template contact template new' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create contacts controller' do
    let(:contact_created) { Contact.new({ name: 'Contact One', tax_number: '12345678F'})}
    let(:contact_error) { Contact.new({'name' => 'Contact Two'})}
    let(:contact_params) { {'name' => 'Contact One', 'tax_number:' => '12345678F'} }
    it 'creates a new contact instance and response success' do
      expect(Contact).to receive(:new).and_return(contact_created)
      expect(contact_created).to receive(:save).and_return(true)
      post :create, contact_params
      expect(response).to be_success
    end

    it 'renders contact template index when all is ok' do
      allow(Contact).to receive(:new).and_return(contact_created)
      allow(contact_created).to receive(:save).and_return true
      post :create, contact_params
      expect(response).to render_template(:index)
    end


    it 'renders contact template new and shows errors when any is failed ' do
      allow(Contact).to receive(:new).and_return(contact_error)
      allow(contact_error).to receive(:save).and_return false
      contact_error.valid?
      post :create, :contact => {'name' => 'Contact Two'}
      expect(contact_error.errors[:tax_number]).to include("can't be blank")
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #update contacts controller' do
    it 'finds the contact_id passed' do
      allow(Contact).to receive(:find).and_return contact
      put :update, id: '18', contact: {:name => 'Foo'}
      expect(assigns(:contact)).to eq(contact)
    end

    it 'updates contact with params passed' do
      allow(Contact).to receive(:find).and_return contact
      put :update, id: '18', contact: {:name => 'Foo'}
      expect(contact.name).to eq('Foo')
    end

    it' renders the contact template' do
      allow(Contact).to receive(:find).and_return(contact)
      put :update, id: '8', contact: {:name => 'Foo'}
      expect(response).to render_template(:index)
    end
  end

  describe 'get #show contacts controller' do
    it 'finds the contact_id passed' do
      allow(Contact).to receive(:find).and_return(contact)
      get :show, id: '8'
      expect(assigns(:contact)).to eq(contact)
    end

    it' renders the contact template' do
      allow(Contact).to receive(:find).and_return(contact)
      get :show, :id => 8
      expect(response).to render_template(:show)
    end

    it 'returns a flash with the error message and renders the index page' do
      allow(Contact).to receive(:find).and_return nil
      get :show, id: 3
      expect(flash[:error]).to eql("Could not show the contact")
      expect(response).to render_template('index')
    end
  end
end
