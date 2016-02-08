class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    @order.save
    redirect_to orders_url
  end

  def update
    @order = Order.find(params[:id])

    if @order.update(:params_data)
      redirect_to @order
    end
  end
end
