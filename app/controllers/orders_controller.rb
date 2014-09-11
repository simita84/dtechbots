class OrdersController < ApplicationController
  
  layout 'admin'

  before_filter :confirm_admin_logged_in


  def index

    @orders=Order.order("orders.created_at DESC").paginate(page: params[:page],per_page: 5)

  end

  def show
  end

  def new
  end


  def create
  end

  def edit
    @order=Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to orders_path, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end

  
