class HomeController < ApplicationController

	layout 'admin'
	  before_filter :confirm_admin_logged_in

  def index
  	   @orders=Order.order("orders.created_at DESC").paginate(page: params[:page],per_page: 5)
  end
end
