class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      render :action => 'index'
    else
      flash[:error] =  @article.errors.messages
      render :action => 'new'
    end
  end

  def update
    @article = Article.find_by_id(params[:id])

    if @article.try(:update_attributes, params[:article])
      render :action => 'index'
    else
      render :action => 'show'
    end
  end

  def show
    @article = Article.find_by_id(params[:id])
    if @article.present?
      render :show
    else
      flash[:error] = "Could not show the article"
      render :action => 'index'
    end
  end
end
