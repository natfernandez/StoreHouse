require 'spec_helper'

RSpec.describe ContactsController, :type => :controller do
  routes { StoreHouse::Application.routes }
  let(:contact) { stub_model(Contact, { id: 18 , name: 'Contact One', tax_number: '12345678F'} ) }
  let(:contact_params) { {'name' => 'Contact One', 'tax_number:' => '12345678F'} }
  let(:errors) { double 'Errors' }

  describe 'GET #index' do
    it 'returns all contacts and renders index template' do
      expect(Contact).to receive(:all)
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

    it 'render contact new template' do
      allow(Contact).to receive(:new)
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create contacts controller' do
    it 'creates a new contact instance and response success' do
      expect(Contact).to receive(:new).and_return(contact)
      allow(contact).to receive(:save).and_return(true)
      post :create, contact_params
      expect(response).to be_success
    end

    it 'renders contact index template when all is ok' do
      allow(Contact).to receive(:new).and_return(contact)
      allow(contact).to receive(:save).and_return true
      post :create, contact_params
      expect(response).to render_template(:index)
    end

    it 'renders contact template new and shows errors when any is failed ' do
      allow(Contact).to receive(:new).and_return(contact)
      allow(contact).to receive(:save).and_return false
      allow(contact).to receive(:valid?).and_return false
      allow(contact).to receive(:errors).and_return errors
      allow(errors).to receive(:messages).and_return(:foo => ['Bar'])
      post :create, contact_params
      expect(contact.errors.messages[:foo]).to include('Bar')
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #update contacts controller' do
    it 'finds the contact_id passed' do
      expect(Contact).to receive(:find_by_id).and_return contact
      allow(contact).to receive(:update_attributes).and_return true
      put :update, id: '18', contact: contact_params
      expect(assigns(:contact)).to eq(contact)
    end

    it 'updates contact with params passed' do
      allow(Contact).to receive(:find_by_id).and_return contact
      expect(contact).to receive(:update_attributes).and_return true
      put :update, id: '18', contact: contact_params
    end

    it 'renders index contact template if all was ok' do
      allow(Contact).to receive(:find_by_id).and_return(contact)
      allow(contact).to receive(:update_attributes).and_return true
      put :update, id: '8', contact: {:name => 'Foo'}
      expect(response).to render_template(:index)
    end

    it 'renders index contact template if anything failed' do
      allow(Contact).to receive(:find_by_id).and_return(contact)
      allow(contact).to receive(:update_attributes).and_return false
      put :update, id: '8', contact: {:name => 'Foo'}
      expect(response).to render_template(:show)
    end
  end

  describe 'get #show contacts controller' do
    it 'finds the contact_id passed' do
      allow(Contact).to receive(:find_by_id).and_return(contact)
      allow(contact).to receive(:present?).and_return true
      get :show, id: '8'
      expect(assigns(:contact)).to eq(contact)
    end

    it' renders show contact template' do
      allow(Contact).to receive(:find_by_id).and_return(contact)
      get :show, :id => 8
      expect(response).to render_template(:show)
    end

    it 'returns a flash with the error message and renders the index page' do
      allow(Contact).to receive(:find_by_id).and_return nil
      get :show, id: 3
      expect(flash[:error]).to eql("Could not show the contact")
      expect(response).to render_template('index')
    end
  end
end
