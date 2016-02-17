class CostsController < ApplicationController
  def new
    @cost = Cost.new
  end

  def index
    @costs = Cost.all
  end

  def create
    @cost = Cost.new(params[:cost])
    if @cost.save
      render :action => :index
    else
      render :action => :new
    end
  end

  def update
    @cost = Cost.find_by_id(params[:id])

    if @cost.try(:update_attributes, params[:cost])
      render :action => :index
    else
      flash[:error] =  @cost.errors.messages
      render :action => :show
    end
  end
end

