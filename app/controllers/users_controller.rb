class UsersController < ApplicationController
	def create
		if(params[:user][:password] != params[:user][:confirmpassword])
			flash.now[:error] = "Password and password confirmation did not match"
			render 'users/signup'
		end
		User.create(:userid => params[:user][:username], :password => params[:user][:password],  \
			:favbook => params[:user][:favbook], :favauthor => params[:user][:favauthor], \
			:favgenre => params[:user][:favgenre], :aboutme => params[:user][:aboutme])
		@user = User.find_by(userid: params[:user][:username])
		puts user.userid
		session[:remember_token] = user.id
		render 'profile'
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
		puts "USER IS #{@user}" 
		@books = [1,2,3,4,5,6,7,8,9,10,11,12]
		# @user.recommended_books(10, 0)
	end

	def like_button (book_id) 
	end

end
