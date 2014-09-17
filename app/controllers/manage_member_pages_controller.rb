class ManageMemberPagesController < ApplicationController
 
	layout 'member'

  before_filter :confirm_member_logged_in
 
  
  


  def home
    


  end

  def index
  end

  def listInventory
  	@inventories = Inventory.order("inventories.created_at DESC").paginate(page: params[:page],per_page: 5)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inventories }
    end
  end

 
  def createOrder

  	  @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to member_pages_inventory_path, notice: 'Inventory was successfully created.' }
        format.json { render json: member_pages_inventory_path, status: :created, location: @order }
      else
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  

  end


end
