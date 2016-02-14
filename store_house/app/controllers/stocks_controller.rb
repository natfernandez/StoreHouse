class StocksController < ApplicationController
  def index
    @stocks = Stock.all
  end
  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(params[:stock])
    if @stock.save
      render :action => :index
    else
      render :action => :new
    end
  end

  def update
    @stock = Stock.find(params[:id])

    if @stock.update_attributes(params[:stock])
      render :action => :index
    else
    binding.pry
      render :action => :new
    end
  end
end

