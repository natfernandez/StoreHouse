class BusinessDataController < ApplicationController
  def new
    @bussines_data = BusinessData.new
  end

  def create
    @bussines_data = BusinessData.new(params[:business_data])
    @bussines_data.save
    redirect_to business_data_url
  end
end
