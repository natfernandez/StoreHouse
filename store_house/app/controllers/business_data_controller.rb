class BusinessDataController < ApplicationController
  def new
    @bussines_data = BusinessData.new
  end

  def create
    @bussines_data = BusinessData.new(params[:business_data])
    @bussines_data.save
    redirect_to business_data_url
  end

  def update
    @business_data = BusinessData.find(params[:id])

    if @business_data.update(:params_data)
      redirect_to @business_data
    end
  end
end
