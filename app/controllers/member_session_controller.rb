class MemberSessionController < ApplicationController


	def new
	end

	def create
	  member = Member.find_by_username(params[:username])
	  if member && member.authenticate(params[:password])
	    session[:member_id] = member.id
 
	    #Check users cart id
	    cart=Cart.find_by_member_username(member.username)

	    if cart
	      session[:cart_id] = cart.id
	    else
	       cart = Cart.new
	       cart.member_username=member.username
	       cart.update_attributes(params[:cart])	
	       session[:cart_id] = cart.id
	    end

	 
	    
	    redirect_to member_pages_index_path, notice: "Logged in!"
	  else

	    flash.now.alert = "username or password is invalid"
	    render "new"
	  end
   end

	def destroy
	  session[:member_id] = nil
	  #session[:cart_id] = nil
	  redirect_to new_member_session_path, notice: "Logged out!"
	end

end
