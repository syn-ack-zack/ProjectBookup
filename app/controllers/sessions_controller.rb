class SessionsController < ApplicationController

    @@attempts = 0

    def login
    end

    def create
        user = User.find_by(userid: params[:session][:username])
        if user && user.password == params[:session][:password]
        	session[:remember_token] = user.id
            render 'users/profile'
          @@attempts = 0
        else
        	flash[:notice] = 'Invalid username or password'
          @@attempts += 1
          if @@attempts == 3
            flash[:notice] = 'That acccount information wasn\'t found. Create an account!'
            render 'users/signup'
            flash[:notice] = ""
            @@attempts = 0
            return
          end
            render 'sessions/login'
          flash[:notice] = ""
        end
    end

    def logout
        session[:remember_token] = nil
        render 'users/splash'
    end

end
