class BusinessDataController < ApplicationController
  def new
    @business_data = BusinessData.new
  end

  def create
    @business_data = BusinessData.new(params[:business_data])
    @business_data.save

    if @business_data
      render :index
    else
      flash[:error] =  @businnes_data.errors.messages
      render :action => 'index'
    end
  end

  def update
    @business_data = BusinessData.find(params[:id])
    if @business_data.update_attributes(params[:business_data])
      render :action => 'index'
    end
  end
end
