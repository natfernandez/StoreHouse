require 'spec_helper'

RSpec.describe OrdersController, :type => :controller do
  routes { StoreHouse::Application.routes }
  let(:order) { stub_model(Order, { id: 8 , order_number: 22, date: '2016/01/01', contact_id: 88, discount: 10} ) }

  describe 'GET #index' do
    it 'returns all orders' do
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
    let(:order_created) { Order.new({'order_number' => '999', 'date' => '2016/01/01'})}
    let(:order_error) { Order.new({'order_number' => '555'})}
    let(:order_params) { {'order_numbre' => '999', 'date' => '2016/01/01'} }
    it 'creates a new order instance and response success' do
      expect(Order).to receive(:new).and_return(order_created)
      expect(order_created).to receive(:save).and_return(true)
      post :create, order_params
      expect(response).to be_success
    end

    it 'renders article template index when all is ok' do
      allow(Order).to receive(:new).and_return(order_created)
      allow(order_created).to receive(:save).and_return true
      post :create, order_params
      expect(response).to render_template(:index)
    end


    it 'renders article template new and shows errors when any is failed ' do
      allow(Order).to receive(:new).and_return(order_error)
      allow(order_error).to receive(:save).and_return false
      order_error.valid?
      post :create, :article => {'order_number' => 33}
      expect(order_error.errors[:date]).to include("can't be blank")
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #update articles controller' do
    it 'finds the order_id passed' do
      allow(Order).to receive(:find).and_return order
      put :update, id: '8', order: {:order_number => 22}
      expect(assigns(:order)).to eq(order)
    end

    it 'updates article with params passed' do
      allow(Order).to receive(:find).and_return order
      put :update, id: '8', order: {:order_number => 43}
      expect(order.order_number).to eq(43)
    end

    it' renders the article template' do
      allow(Order).to receive(:find).and_return order
      put :update, id: '8', order: {:order_number => 22}
      expect(response).to render_template(:index)
    end
  end
end
