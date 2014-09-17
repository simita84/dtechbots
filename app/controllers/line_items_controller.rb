class LineItemsController < ApplicationController
  # GET /line_items
  # GET /line_items.json

    layout 'member'

  before_filter :confirm_member_logged_in
  before_filter :find_inventory
  
    
    
  def index

   @line_items = LineItem.where(:cart_id=>current_cart.id)
   @inventories=Inventory.all

    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.json
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    #@line_item = LineItem.find(params[:id])
     @line_item = LineItem.where(:inventory_id=>14)

     @inventories=Inventory.all
  
  end

  # POST /line_items
  # POST /line_items.json
  def create

    cart=current_cart
    #@line_items=Cart.find_by_cart_id(current_cart.id)
   inventory = Inventory.find(params[:inventory_id])
   # @cart.line_items.build(params[:line_items])
    #@line_item=LineItem.new(params[:id])
    #@line_item.update_attributes(:bk_qty=>@line_item.bk_qty)
    @line_item=cart.line_items.build(:inventory_id => inventory.id)
    @line_item.update_attributes(params[:line_item])

   #@line_item=LineItem.new(params[:line_item])

  
    
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to member_pages_inventory_path, notice: 'Line item was successfully created.' }
        format.json { render json: member_pages_inventory_path, status: :created, location: carts_path }
 
      else
        format.html { render action: "new" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }

      end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.json
  def update
     cart=current_cart
    @line_item = LineItem.find(params[:id])
     inventory = Inventory.find(params[:inventory_id])


    respond_to do |format|
      if @line_item.update_attributes(:bk_qty=>@line_item.bk_qty)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    flash[:notice]="destroyed"

    respond_to do |format|
      format.html { redirect_to cart_path }
      format.json { head :no_content }
    end
  end


 

 private 

        def find_inventory
          if (params[:id])
            @inventory=Inventory.find_by_id(params[:id])
        end
  end

end
