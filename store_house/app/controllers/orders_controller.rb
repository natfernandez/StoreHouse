class OrdersController < ApplicationController

  # before_filter :load_contact, :only => [:create, :new]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    @order.order_line_items.new(params[:order_line_items])

    if @order.save
      render :action => :index
    else
      render :action => :new
    end
  end

  def update
    @order = Order.find_by_id(params[:id])

    @order_line_items = OrderLineItem.find_by_order_id(params[:id])
    @order_line_items.update_attributes(params[:order_line_items])

    if @order.update_attributes(params[:order])
      render :action => :index
    else
      render :action => :new
    end
  end

  private
  def load_contact
    @contact = @order.build_contact
  end
end
