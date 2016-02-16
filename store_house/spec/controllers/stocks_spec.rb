require 'spec_helper'

RSpec.describe StocksController, :type => :controller do
  routes { StoreHouse::Application.routes }
  let(:stock) { double('Stock',{ id: 1 , article_id: 15, colour_id: 5, 'size_id' => 21})}

  describe 'GET #index' do
    it 'returns all stock' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new stock controller' do
    it 'creates a new stock instance' do
      get :new
      stock = assigns[:stock]
      expect(stock).to be_present
    end

    it 'render stock template new' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create stocks controller' do
    let(:stock_params) { {'article_id' => 9} }
    it 'creates a new stock instance and response success' do
      expect(Stock).to receive(:new).and_return(stock)
      expect(stock).to receive(:save).and_return(true)
      post :create, stock_params
      expect(response).to be_success
    end

    it 'renders cost template index when all is ok' do
      allow(Stock).to receive(:new).and_return(stock)
      allow(stock).to receive(:save).and_return true
      post :create, stock_params
      expect(response).to render_template(:index)
    end

    it 'renders stock template new and shows errors when any is failed ' do
      allow(Stock).to receive(:new).and_return(stock)
      allow(stock).to receive(:save).and_return false
      allow(stock).to receive(:valid?).and_return false
      allow(stock).to receive(:errors).and_return(:foo =>['Bar'])
      post :create, stock_params
      expect(stock.errors[:foo]).to include('Bar')
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #update stock controller' do
    let(:params_update) { {:colour_id => 20} }
    it 'finds the stock_id passed' do
      allow(Stock).to receive(:find).and_return stock
      expect(stock).to receive(:update_attributes)
      put :update, id: '18', stock: params_update
    end

    it 'updates stock with params passed' do
      expect(Stock).to receive(:find).and_return stock
      expect(stock).to receive(:update_attributes).and_return true
      put :update, id: '18', stock: params_update
    end

    it 'renders the stock index template when all go ok' do
      allow(Stock).to receive(:find).and_return(stock)
      allow(stock).to receive(:update_attributes).and_return(true)
      put :update, id: '8', stock: params_update
      expect(response).to render_template(:index)
    end

    it 'renders the stock index template when any fails' do
      allow(Stock).to receive(:find).and_return(stock)
      allow(stock).to receive(:update_attributes).and_return(false)
      put :update, id: '8', stock: params_update
      expect(response).to render_template(:new)
    end

    it 'shows messages when any fails' do
      allow(Stock).to receive(:find).and_return(stock)
      allow(stock).to receive(:update_attributes).and_return(false)
      allow(stock).to receive(:valid?).and_return(false)
      allow(stock).to receive(:errors).and_return(:foo => ['Bar'])
      put :update, id: '8', stock: params_update
      expect(stock.errors[:foo]).to include('Bar')
    end
  end

  describe 'get #show stocks controller' do
    it 'finds the stock_id passed' do
      expect(Stock).to receive(:find).and_return(stock)
      get :show, id: '8'
    end

    it' renders the stock template' do
      allow(Stock).to receive(:find).and_return(stock)
      get :show, :id => 8
      expect(response).to render_template(:show)
    end

    it 'returns a flash with the error message and renders the index page' do
      allow(Stock).to receive(:find).and_return nil
      get :show, id: 3
      expect(flash[:error]).to eql("Could not show the stock")
      expect(response).to render_template('index')
    end
  end
end

