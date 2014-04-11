module SessionsHelper
	def sign_in(user)  	
    	self.current_user = User.find(session[:remember_token])
  	end

  	def current_user
        @current_user ||= User.find(session[:remember_token])
  	end

  	def signed_in?
    	!current_user.nil?
  	end
end
