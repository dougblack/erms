class SessionsController < ApplicationController
	
	def new
            puts "Log in called"
	end

	def create
		current_user = User.find_by_sql("SELECT * FROM users WHERE username = '#{params["username"]}'").first
		if current_user && current_user.password == params["password"]
			session[:user_id] = current_user.id
			redirect_to root_url, notice: "Logged in!"
		else
			redirect_to "/log_in", notice: "Incorrect username or password!"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: "Logged out!"
	end

end
