class StocksController < ApplicationController
  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(params[:stock])
    @stock.save
    redirect_to stocks_url
  end

  def update
    @stock = Stock.find(params[:id])

    if @stock.update(:params_data)
      redirect_to @stock
    end
  end
end

