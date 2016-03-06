require 'spec_helper'

RSpec.describe OrdersController, :type => :controller do
  routes { StoreHouse::Application.routes }
  let(:order) { stub_model Order, :id => 8 , :order_number => 22, :date => '2016/01/01', :contact_id => 88, :discount => 10 }
  let(:order_line_item) { double('OrderLineItem', { :order_id => 8, :article_id => 1, :colour => 'azul',
                                                    :size => 'M', :price => 5.0, :quantity => 4 }) }
  let(:contact) { double('Contact', { id: 18 , name: 'Contact One', tax_number: '12345678F'} ) }
  let(:order_params) { {'order_number' => '999', 'date' => '2016/01/01'} }
  let(:errors) { double 'Errors' }

  describe 'GET #index' do
    it 'returns all orders' do
      expect(Order).to receive(:all)
      get :index
    end

    it 'renders index view' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new orders controller' do
    it 'creates a new order instance' do
      get :new
      order = assigns[:order]
      expect(order).to be_present
    end

    it 'render order template new' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create orders controller' do
    before do
      allow(Order).to receive(:new).and_return(order)
      allow(order).to receive(:assign_attributes)
      allow(order).to receive(:save).and_return(true)
      post :create, order_params
    end

    it 'shows a message when all was ok' do
      expect(flash.notice).to eq('El registro se ha guardado correctamente.')
    end

    it 'redirect to business_data_url when all is ok' do
      expect(subject).to redirect_to(business_data_url)
    end


    it 'renders article template new and shows errors when any is failed ' do
      allow(order).to receive(:save).and_return false
      allow(order).to receive(:valid?).and_return(false)
      allow(order).to receive(:errors).and_return(errors)
      allow(errors).to receive(:messages).and_return(:foo => ['Bar'])
      post :create, order_params
      expect(order.errors.messages[:foo]).to include('Bar')
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #update articles controller' do
    let(:params_order) { {'order_number' => '43'} }
    it 'finds the order_id passed' do
      expect(Order).to receive(:find_by_id).and_return order
      allow(subject).to receive(:update_contact).and_return true
      allow(subject).to receive(:update_order_line_items).and_return(contact)
      allow(order).to receive(:update_attributes).and_return true
      put :update, id: '8', order: {:order_number => 43}
    end

    it 'updates article with params passed' do
      allow(Order).to receive(:find_by_id).and_return order
      allow(subject).to receive(:update_contact).and_return true
      allow(subject).to receive(:update_order_line_items).and_return(contact)
      expect(order).to receive(:update_attributes).with(params_order).and_return true
      put :update, id: '8', order: params_order
    end

    it 'renders the article template' do
      allow(Order).to receive(:find_by_id).and_return order
      allow(subject).to receive(:update_contact).and_return true
      allow(subject).to receive(:update_order_line_items).and_return(contact)
      allow(order).to receive(:update_attributes).with(params_order).and_return true
      put :update, id: '8', order: params_order
      expect(response).to render_template(:index)
    end
  end

  # describe 'callbacks' do
  #   it 'loads contacts on create' do
  #     expect(order).to receive(:load_contact)
  #     order.run_callbacks :create
  #   end
  # end
end
