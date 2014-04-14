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

	# The user profile shows all of the recommended books for a user
	def profile
		# Gets the current user
		user = User.find_by(id: session[:remember_token]);
		# This is set up for the recommendable gem
		Recommendable::Helpers::Calculations.update_similarities_for(user.id)
		Recommendable::Helpers::Calculations.update_recommendations_for(user.id)

		puts "USER IS #{user.userid}"
		# returns the 12 
		# TODO UPDATE FOR REFRESH 
		@books = user.recommended_books 12
	end

	def like_button (book_id) 
	end

end
