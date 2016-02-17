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

  def destroy
    @article = Article.find_by_id(params[:id])
    @article.deleted_at = Date.today
    @article.save unless article_used?(params[:id])
    render :action => :index
  end

  private

  def article_used?(article_id)
    true if ( Cost.find_by_article_id(article_id) || OrderLineItem.find_by_article_id(article_id) || Stock.find_by_article_id(article_id) )
    false
  end
end
