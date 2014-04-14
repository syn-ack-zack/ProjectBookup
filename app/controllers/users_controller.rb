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
    elsif !user.valid?
        flash[:notice] = "Username or Password not valid!"
        render 'users/signup'
        flash[:notice] = ""
        return
    end
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
	Recommendable::Helpers::Calculations.update_similarities_for(user.id)
	Recommendable::Helpers::Calculations.update_recommendations_for(user.id)
	@books = user.recommended_books 12
end

def like_button (book_id) 
end

end

