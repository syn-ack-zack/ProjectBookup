class SessionsController < ApplicationController

    def login
    end

    def create
        user = User.find_by(userid: params[:session][:username])
        if user && user.password == params[:session][:password]
        	session[:remember_token] = user.id
            render 'new'
        else
        	flash.now[:error] = 'Invalid username or password'
            render 'users/signup'
        end
    end

    def destroy
    end

end
