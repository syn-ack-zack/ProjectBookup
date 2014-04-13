class UsersController < ApplicationController
def create
		if(params[:user][:password] != params[:user][:confirmpassword])
			flash.now[:error] = "Password and password confirmation did not match"
			render 'users/signup'
		else
		User.create(:userid => params[:user][:username], :password => params[:user][:password],  \
			:favbook => params[:user][:favbook], :favauthor => params[:user][:favauthor], \
			:favgenre => params[:user][:favgenre], :aboutme => params[:user][:aboutme])
		user = User.find_by(userid: params[:user][:username])
		session[:remember_token] = user.id
		render 'profile'
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
	def profile
		user = User.find_by(id: session[:remember_token]);
		puts "USER IS #{user.userid}"
		@books = user.recommended_books;
		# @user.recommended_books(10, 0)
	end

	def like_button (book_id) 
	end

end
