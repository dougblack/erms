class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :check_login, :unless => proc {|c| c.params[:controller] == "sessions"}
  private

  def current_user
        if session != nil && session[:user_id]
	    @current_user ||= User.find_by_sql("SELECT * FROM users WHERE id = #{session[:user_id]}").first
        else
            return nil
        end
  end

  def check_login
            redirect_to log_in_path unless session[:user_id]
  end
 
end
