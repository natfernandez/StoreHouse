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
    @order.order_line_items.build(params[:order_line_items])
    @order.build_contact(params[:contact])
    if @order.save
      render :action => :index
    else
      flash[:error] =  @order.errors.messages
      render :action => :new
    end
  end

  def update
    @order = Order.find_by_id(params[:id])

    update_contact if params[:contact]
    update_order_line_items if params[:order_line_items]
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

  def update_contact
    @order.contact.assign_attributes(params[:contact])
    @order.contact.save
  end

  def update_order_line_items
    @order.order_line_items.assign_attributes(params[:order_line_items])
    @order.order_line_items.save
  end
end
