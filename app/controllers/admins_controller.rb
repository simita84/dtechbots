class AdminsController < ApplicationController


	layout 'admin'
	  before_filter :confirm_admin_logged_in

	def index
		 @admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
	end

	def show
		 @admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
	end

	def new
	  @admin = Admin.new
	end

	def create
	  @admin = Admin.new(params[:admin])
	  if @admin.save
	    session[:admin_id] = @admin.id
	    redirect_to root_url, notice: "Thank you for signing up!"
	  else
	    render "new"
	  end
	end

	def edit
		 @admin=Admin.find(params[:id])
	end

	def update

        @admin=Admin.find(params[:id])
 
        @admin.update_attributes(params[:admin])
           
           if @admin.save
   
             flash[:success]= "Admin details for --"+@admin.username+"--updated successfully"
             redirect_to admin_path(current_admin)
           else
              flash[:warning]= "Admin details for"+ @admin.username+" cannot be updated. "
             render('edit')
           end

	end


end
