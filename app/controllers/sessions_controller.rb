class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(name: params[:session][:username])
        if user && user.password == params[:session][:password]
            @user = user
            render 'users/profile'
        else
            render 'new'
        end
    end

    def destroy
    end

end
