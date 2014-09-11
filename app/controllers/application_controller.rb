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
  

end
