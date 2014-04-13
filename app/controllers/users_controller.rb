class UsersController < ApplicationController
	def create
		if !(params[:user][:password] == params[:user][:confirmpassword])
			flash[:notice] = "Password and password confirmation did not match"
			render 'users/signup'
      return
    end

		user = User.new(:userid => params[:user][:username], :password => params[:user][:password],  \
			:favbook => params[:user][:favbook], :favauthor => params[:user][:favauthor], \
			:favgenre => params[:user][:favgenre], :aboutme => params[:user][:aboutme])
    if user.already_exists(user.userid, user.password) == -1
    user.save
		session[:remember_token] = user.id
		render 'profile'
      return
    elsif user.already_exists(user.userid, user.password) == 0
      flash[:notice] = "Username already exists"
      render 'users/signup'
      flash[:notice] = ""
      return
    else
      flash[:notice] = "User already exists!"
      render 'sessions/login'
      return
      end
	end
	def new
	end
	def show
	end
	def edit
	end
	def update
	end
	def splash
	end
	def signup

	end
end
