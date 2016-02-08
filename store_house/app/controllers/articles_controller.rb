class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.save
    redirect_to articles_url
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(:params_data)
      redirect_to @article
    end
  end
end
