class UsersController < ApplicationController
  #Create will run when a new user is created
def create
  #Create a temporary user object with parameters from the user signup forms
   user = User.new(:userid => params[:user][:username], :password => params[:user][:password],  \
      :favbook => params[:user][:favbook], :favauthor => params[:user][:favauthor], \
      :favgenre => params[:user][:favgenre], :aboutme => params[:user][:aboutme])

   #If the user doesn't have a username or password, render the page again and display an error
    if !user.has_username_and_password
      flash[:notice] = "Username and password are required!"
      render 'users/signup'
      flash[:notice] = ""
      return
    end

   #If the user password and confirmation password don't match, render the page and show an error
    if !user.confirmation_password(params[:user][:confirmpassword], user.password)
      flash[:notice] = "Password and Confirmation Password do not match!"
      render 'users/signup'
      flash[:notice] = ""
      return
    end

   #If the user doesn't exist in the database and is valid, add them and redirect to profile page
    if user.already_exists(user.userid, user.password) == -1 && user.valid?
      user.save
      session[:remember_token] = user.id
      redirect_to  action: 'profile', controller: 'users'
      flash[:notice] = ""
      return
   #If the UserId is already in the database, render the page and show an error
    elsif user.already_exists(user.userid, user.password) == 0
      flash[:notice] = "Username already exists!"
      render 'users/signup'
      flash[:notice] = ""
      return
  #If the UserId and Password are already in the database, render the login page and notify the user
    elsif user.already_exists(user.userid, user.password) == 1
      flash[:notice] = "User already exists! Log in!"
      render 'sessions/login'
      flash[:notice] = ""
      return
    else
  #This is will only occur if the user isn't valid, so show the error and render the signup again
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

    # puts @books
end

def likebook
  user = User.find_by(id: params[:useridentifier])
  book = Book.find_by(id: params[:bookidentifier])
  if(user.dislikes?(book))
    user.undislike(book)
  end
  user.like(book)
end

def dislikebook
  user = User.find_by(id: params[:useridentifier])
  book = Book.find_by(id: params[:bookidentifier])
  if(user.likes?(book))
    user.unlike(book)
  end
  user.dislike(book)
end

end

