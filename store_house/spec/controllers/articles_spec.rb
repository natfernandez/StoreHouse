require 'spec_helper'

RSpec.describe ArticlesController, :type => :controller do
  routes { StoreHouse::Application.routes }
  let(:article) { stub_model(Article, { id: 8 , code: 'code', description: 'description'} ) }

  describe 'GET #index' do
    it 'returns all products' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new articles controller' do
    it 'creates a new article instance' do
      get :new
      article = assigns[:article]
      expect(article).to be_present
    end

    it 'render article template article template new' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create articles controller' do
    let(:article_created) { Article.new({'code' => '999', 'description' => 'Jumper'})}
    let(:article_error) { Article.new({'description' => 'Jumper'})}
    let(:article_params) { {'code' => '999', 'description' => 'Jumper'} }
    it 'creates a new article instance and response success' do
      expect(Article).to receive(:new).and_return(article_created)
      expect(article_created).to receive(:save).and_return(true)
      post :create, article_params
      expect(response).to be_success
    end

    it 'renders article template index when all is ok' do
      allow(Article).to receive(:new).and_return(article_created)
      allow(article_created).to receive(:save).and_return true
      post :create, article_params
      expect(response).to render_template(:index)
    end


    it 'renders article template new and shows errors when any is failed ' do
      allow(Article).to receive(:new).and_return(article_error)
      allow(article_error).to receive(:save).and_return false
      article_error.valid?
      post :create, :article => {'description' => 'Jumper'}
      expect(article_error.errors[:code]).to include("can't be blank")
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #update articles controller' do
    it 'finds the article_id passed' do
      allow(Article).to receive(:find).and_return article
      put :update, id: '8', article: {:description => 'Sweater black'}
      expect(assigns(:article)).to eq(article)
    end

    it 'updates article with params passed' do
      allow(Article).to receive(:find).and_return article
      put :update, id: '8', article: {:description => 'Sweater black'}
      expect(article.description).to eq('Sweater black')
    end

    it' renders the article template' do
      allow(Article).to receive(:find).and_return(article)
      put :update, id: '8', article: {:description => 'Sweater black'}
      expect(response).to render_template(:index)
    end
  end

  describe 'get #show articles controller' do
    it 'finds the article_id passed' do
      allow(Article).to receive(:find).and_return(article)
      get :show, id: '8'
      expect(assigns(:article)).to eq(article)
    end

    it' renders the article template' do
      allow(Article).to receive(:find).and_return(article)
      get :show, :id => 8
      expect(response).to render_template(:show)
    end

    it 'returns a flash with the error message and renders the index page' do
      allow(Article).to receive(:find).and_return nil
      get :show, id: 3
      expect(flash[:error]).to eql("Could not show the article")
      expect(response).to render_template('index')
    end
  end
end
