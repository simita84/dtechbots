class ApplicationController < ActionController::Base
  protect_from_forgery

   private

def current_admin
  @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
end
helper_method :current_admin

def confirm_admin_logged_in
  redirect_to login_url, alert: "Not authorized" if current_admin.nil?
end
  


    private

def current_member
  @current_member ||= Member.find(session[:member_id]) if session[:member_id]
end
helper_method :current_member

def confirm_member_logged_in
  redirect_to new_member_session_path, alert: "Not authorized" if current_member.nil?
end



 private
	def current_cart
		@current_cart ||= Cart.find(session[:cart_id]) if session[:cart_id]
	end

	helper_method :current_cart

end
