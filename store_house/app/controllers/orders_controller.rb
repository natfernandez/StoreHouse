class OrdersController < ApplicationController

  before_filter :load_contact

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

  private
  def load_customer
    @customer = current_business.customers.build
  end
end
