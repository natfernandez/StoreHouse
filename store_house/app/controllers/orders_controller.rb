class OrdersController < ApplicationController

  # before_filter :load_contact

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])

    if @order.save
      render :action => :index
    else
      render :action => :new
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      render :action => :index
    else
      render :action => :new
    end
  end

  private
  def load_customer
    @customer = current_business.customers.build
  end
end
