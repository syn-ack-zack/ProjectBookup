class SessionsController < ApplicationController

    @@attempts = 0

    def login
    end
    
    
    def create
        user = User.find_by(userid: params[:session][:username])
        if user && user.password == params[:session][:password]
<<<<<<< HEAD
            session[:remember_token] = user.id
            redirect_to :actiom => 'users/profile'
        else
            flash.now[:error] = 'Invalid username or password'
            redirect_to :actiom => 'users/signup'
=======
        	session[:remember_token] = user.id
            @@attempts = 0
            redirect_to action: 'profile', controller: 'users'
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
>>>>>>> 12707fe228cbe492d33ebb5904984fba5217402a
        end
    end

    def logout
        session[:remember_token] = nil
        render 'users/splash'
    end

end
