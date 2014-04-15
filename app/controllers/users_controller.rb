class UsersController < ApplicationController
def create
   user = User.new(:userid => params[:user][:username], :password => params[:user][:password],  \
      :favbook => params[:user][:favbook], :favauthor => params[:user][:favauthor], \
      :favgenre => params[:user][:favgenre], :aboutme => params[:user][:aboutme])

    if !user.has_username_and_password
      flash[:notice] = "Username and password are required!"
      render 'users/signup'
      flash[:notice] = ""
      return
    end

    if !user.confirmation_password(params[:user][:confirmpassword], user.password)
      flash[:notice] = "Password and Confirmation Password do not match!"
      render 'users/signup'
      flash[:notice] = ""
      return
    end

    if user.already_exists(user.userid, user.password) == -1 && user.valid?
      user.save
      session[:remember_token] = user.id
      render 'profile'
      flash[:notice] = ""
      return
    elsif user.already_exists(user.userid, user.password) == 0
      flash[:notice] = "Username already exists!"
      render 'users/signup'
      flash[:notice] = ""
      return
    elsif user.already_exists(user.userid, user.password) == 1
      flash[:notice] = "User already exists! Log in!"
      render 'sessions/login'
      flash[:notice] = ""
      return
    else
      flash[:notice] = "Username or Password not valid! Both need to be at least 5 characters long!"
      render 'users/signup'
      flash[:notice] = ""
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

	# The user profile shows all of the recommended books for a user
	def profile
		# Gets the current user
		@user = User.find_by(id: session[:remember_token]);
		# This is set up for the recommendable gem
		Recommendable::Helpers::Calculations.update_similarities_for(@user.id)
		Recommendable::Helpers::Calculations.update_recommendations_for(@user.id)

		# returns the 12 
		# TODO UPDATE FOR REFRESH 
		@books = @user.recommended_books 12
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
def like_button (book_id) 
end

end

