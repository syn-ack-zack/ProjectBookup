class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.authenticate(params[:session][:username], params[:session][:password])
        if user
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
