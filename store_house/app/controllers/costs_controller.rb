class CostsController < ApplicationController
  def new
    @cost = Cost.new
  end

  def create
    @cost = Cost.new(params[:cost])
    @cost.save
    redirect_to costs_url
  end

  def update
    @cost = Cost.find(params[:id])

    if @cost.update(:params_data)
      redirect_to @cost
    end
  end
end

