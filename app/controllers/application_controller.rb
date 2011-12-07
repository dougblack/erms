class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  private

  def current_user
	@current_user ||= User.find_by_sql("SELECT * FROM users WHERE id = #{session[:user_id]}").first if session[:user_id]
  end

  def check_login
        if current_user == nil
            redirect_to "/log_in"
        end
  end
 
end
