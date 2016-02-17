class BusinessDataController < ApplicationController
  def new
    @business_data = BusinessData.new
  end

  def create
    @business_data = BusinessData.new(params[:business_data])
    if @business_data.save
      render :index
    else
      flash[:error] =  @business_data.errors.messages
      render :action => 'index'
    end
  end

  def update
    @business_data = BusinessData.find_by_id(params[:id])
    if @business_data.try(:update_attributes, params[:business_data])
      render :action => 'index'
    else
      render :action => 'show'
    end
  end
end
