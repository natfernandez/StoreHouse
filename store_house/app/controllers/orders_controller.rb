class OrdersController < ApplicationController

  # before_filter :load_contact, :only => [:create, :new]
  before_filter :load_order, :only => [:update, :show]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @order.order_line_items.build
  end

  def create
    @order = Order.new
    @order.assign_attributes(params[:order])
    if @order.save
      flash[:notice] = 'El registro se ha guardado correctamente.'
      redirect_to business_data_url
    else
      flash[:error] =  @order.errors
      render :action => :new
    end
  end

  def update
    @order.assign_attributes(params[:order])
    if @order.save
      flash[:notice] = 'El registro se ha modificado correctamente.'
      redirect_to business_data_url
    else
      flash[:error] =  @order.errors
      render :show
    end
  end

  def show
    @order = Order.find_by_id(params[:id])
  end

  private

  def load_order
    @order = Order.find_by_id(params[:id])
    render :file => 'public/404.html', :status => :not_found unless @order.present?
  end

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
