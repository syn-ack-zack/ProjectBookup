class SessionsController < ApplicationController

    def login
    end

    def create
        user = User.find_by(userid: params[:session][:username])
        if user && user.password == params[:session][:password]
        	session[:remember_token] = user.id
            render 'users/profile'
        else
        	flash[:notice] = 'Invalid username or password'
            render 'sessions/login'
          flash[:notice] = ""
        end
    end

    def logout
        session[:remember_token] = nil
        render 'users/splash'
    end

end
