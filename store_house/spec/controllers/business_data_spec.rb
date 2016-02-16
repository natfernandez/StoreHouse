require 'spec_helper'

RSpec.describe BusinessDataController, :type => :controller do
  routes { StoreHouse::Application.routes }
  let(:business_data) { double('BusinnesData',{ id: 18 , name: 'Business', tax_number: '12345678F'} ) }
  let(:business_params) { {'name' => 'business_data One', 'tax_number:' => '12345678F'} }
  let(:errors) { double ('Errors') }

  describe 'GET #new business_data controller' do
    it 'creates a new business_data instance' do
      get :new
      business_data = assigns[:business_data]
      expect(business_data).to be_present
    end

    it 'render business_data new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create business_data controller' do
    it 'creates a new business_data instance and response success' do
      expect(BusinessData).to receive(:new).and_return(business_data)
      expect(business_data).to receive(:save).and_return(true)
      post :create, business_params
      expect(response).to be_success
    end

    it 'renders business_data index template when all is ok' do
      allow(BusinessData).to receive(:new).and_return(business_data)
      allow(business_data).to receive(:save).and_return true
      post :create, business_params
      expect(response).to render_template(:index)
    end

    it 'renders business_data template new and shows errors when any is failed ' do
      allow(BusinessData).to receive(:new).and_return(business_data)
      allow(business_data).to receive(:save).and_return false
      allow(business_data).to receive(:valid?).and_return false
      allow(business_data).to receive(:errors).and_return errors
      allow(errors).to receive(:messages).and_return(:foo => ['Bar'])
      post :create, :business_data => {'name' => 'business_data Two'}
      expect(business_data.errors.messages[:foo]).to include('Bar')
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #update business_data controller' do
    it 'finds the business_id passed' do
      expect(BusinessData).to receive(:find_by_id).and_return business_data
      allow(business_data).to receive(:update_attributes).and_return true
      put :update, id: '18', business_data: business_params
    end

    it 'updates business_data with params passed' do
      allow(BusinessData).to receive(:find_by_id).and_return business_data
      expect(business_data).to receive(:update_attributes).and_return true
      put :update, id: '18', business_data: business_params
    end

    it 'renders index business_data template if all is ok' do
      allow(BusinessData).to receive(:find_by_id).and_return(business_data)
      allow(business_data).to receive(:update_attributes).and_return true
      put :update, id: '8', business_data: business_params
      expect(response).to render_template(:index)
    end

    it 'renders index business_data template if anything failed' do
      allow(BusinessData).to receive(:find_by_id).and_return(business_data)
      allow(business_data).to receive(:update_attributes).and_return false
      put :update, id: '8', business_data: business_params
      expect(response).to render_template(:show)
    end
  end
end
