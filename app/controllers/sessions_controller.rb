class SessionsController < ApplicationController

  #Variable to keep track of the login attempts
   @@attempts = 0

    def login
    end

   #Create will be called when a user logins in
    def create

      #Find the user in the database, if they are found and their passwords match...
        user = User.find_by(userid: params[:session][:username])
        if user && user.password == params[:session][:password]
          #Save a cookie in the browser that persists until the browser is closed
            session[:remember_token] = user.id
            #Reset attempts coutner and redirect to the user's profile page
            @@attempts = 0
            redirect_to action: 'profile', controller: 'users'
          #If user wasn't found in the database or the password doesn't match...
        else
          #Show an error, add to the attempt counter
            flash[:notice] = 'Invalid username or password'
          @@attempts += 1
            #Redirect to signup page if attempts is 3
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

   #Logout will get rid of the user's cookie to sign them out and redirect to splash
    def logout
        session[:remember_token] = nil
        render 'users/splash'
    end

end
