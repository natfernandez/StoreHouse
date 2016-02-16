require 'spec_helper'

RSpec.describe OrdersController, :type => :controller do
  routes { StoreHouse::Application.routes }
  let(:order) { double('Order',{ id: 8 , order_number: 22, date: '2016/01/01', contact_id: 88, discount: 10 })}
  let(:order_line_item) { double('OrderLineItem', { :order_id => 8, :article_id => 1, :colour => 'azul',
                                                    :size => 'M', :price => 5.0, :quantity => 4 }) }

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
    let(:order_params) { {'order_number' => '999', 'date' => '2016/01/01'} }
    it 'creates a new order instance and response success' do
      expect(Order).to receive(:new).and_return(order)
      expect(order).to receive(:order_line_items).and_return(order_line_item)
      expect(order_line_item).to receive(:new).and_return(order_line_item)
      expect(order).to receive(:save).and_return(true)
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
      allow(Order).to receive(:new).and_return(order)
      allow(order).to receive(:save).and_return false
      allow(order_line_item).to receive(:new).and_return(order_line_item)
      allow(order_line_item).to receive(:save).and_return(true)
      allow(order).to receive(:valid?).and_return(false)
      allow(order).to receive(:errors).and_return(:foo => ['Bar'])
      post :create, :order => {'order_number' => 33}
      expect(order.errors[:foo]).to include('Bar')
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #update articles controller' do
    let(:params_order) { {'order_number' => '43'} }
    it 'finds the order_id passed' do
      expect(Order).to receive(:find_by_id).and_return order
      expect(OrderLineItem).to receive(:find_by_order_id).and_return order_line_item
      allow(order_line_item).to receive(:update_attributes).and_return true
      allow(order).to receive(:update_attributes).and_return true
      put :update, id: '8', order: {:order_number => 43}
    end

    it 'updates article with params passed' do
      allow(Order).to receive(:find_by_id).and_return order
      allow(OrderLineItem).to receive(:find_by_order_id).and_return order_line_item
      expect(order_line_item).to receive(:update_attributes).with(nil).and_return true
      expect(order).to receive(:update_attributes).with(params_order).and_return true
      put :update, id: '8', order: params_order
    end

    it 'renders the article template' do
      allow(Order).to receive(:find).and_return order
      allow(OrderLineItem).to receive(:find_by_order_id).and_return order_line_item
      allow(order_line_item).to receive(:update_attributes).and_return true
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
