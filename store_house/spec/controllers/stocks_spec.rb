require 'spec_helper'

RSpec.describe StocksController, :type => :controller do
  routes { StoreHouse::Application.routes }
  let(:stock) { stub_model(Stock, { id: 1 , article_id: 15, colour_id: 5, 'size_id' => 21} ) }

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
    let(:stock_created) { Stock.new({'article_id' => 123, 'colour_id' => 12, 'size_id' => 2})}
    let(:stock_error) { Stock.new({'article_id' => 10})}
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
      stock.valid?
      post :create, :cost => {'article_id' => 2}
      expect(stock.errors[:quantity]).to include("can't be blank")
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #update stock controller' do
    it 'finds the stock_id passed' do
      allow(Stock).to receive(:find).and_return stock
      put :update, id: '18', colour_id: {:colour_id => 20}
      expect(assigns(:stock)).to eq(stock)
    end

    it 'updates stock with params passed' do
      allow(Stock).to receive(:find).and_return stock
      put :update, id: '18', stock: {:quantity => 99}
      expect(stock.quantity).to eq(99)
    end

    it' renders the stock template' do
      allow(Stock).to receive(:find).and_return(stock)
      put :update, id: '8', stock: {:quantity => 3}
      expect(response).to render_template(:index)
    end
  end
end

