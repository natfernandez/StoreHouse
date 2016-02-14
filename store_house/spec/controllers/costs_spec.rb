require 'spec_helper'

RSpec.describe CostsController, :type => :controller do
  routes { StoreHouse::Application.routes }
  let(:cost) { stub_model(Cost, { id: 1 , article_id: 15, raw_material: 100.30} ) }

  describe 'GET #index' do
    it 'returns all costs' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new costs controller' do
    it 'creates a new cost instance' do
      get :new
      cost = assigns[:cost]
      expect(cost).to be_present
    end

    it 'render cost template cost template new' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create costs controller' do
    let(:cost_created) { Cost.new({'raw_material' => 123})}
    let(:cost_error) { Cost.new({'raw_material' => 100.9})}
    let(:cost_params) { {'raw_material' => 99.0} }
    it 'creates a new contact instance and response success' do
      expect(Cost).to receive(:new).and_return(cost_created)
      expect(cost_created).to receive(:save).and_return(true)
      post :create, cost_params
      expect(response).to be_success
    end

    it 'renders cost template index when all is ok' do
      allow(Cost).to receive(:new).and_return(cost_created)
      allow(cost_created).to receive(:save).and_return true
      post :create, cost_params
      expect(response).to render_template(:index)
    end


    it 'renders cost template new and shows errors when any is failed ' do
      allow(Cost).to receive(:new).and_return(cost_error)
      allow(cost_error).to receive(:save).and_return false
      cost_error.valid?
      post :create, :cost => {'raw_material' => 200.3}
      expect(cost_error.errors[:article_id]).to include("can't be blank")
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #update cost controller' do
    it 'finds the cost_id passed' do
      allow(Cost).to receive(:find).and_return cost
      put :update, id: '18', cost: {:raw_material => 200.0}
      expect(assigns(:cost)).to eq(cost)
    end

    it 'updates cost with params passed' do
      allow(Cost).to receive(:find).and_return cost
      put :update, id: '18', cost: {:raw_material => 99.0}
      expect(cost.raw_material).to eq(99.0)
    end

    it' renders the cost template' do
      allow(Cost).to receive(:find).and_return(cost)
      put :update, id: '8', cost: {:raw_material => 103.0}
      expect(response).to render_template(:index)
    end
  end
end
