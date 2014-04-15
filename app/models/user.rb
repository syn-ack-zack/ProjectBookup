class User < ActiveRecord::Base
recommends :books
  #Validation for the userid field in User, requires presence, minimum length of 5, must be unique and can't include whitespace
    validates :userid, :presence => true, length: { minimum: 5}, uniqueness: { case_sensitive: false}, format: { without: /\s/ }

  #Validation for the password field in User, requires presence, length between 5-35, and can't include whitespace
    validates :password, :presence => true, length: {minimum: 5, maximum: 35}, format: { without: /\s/ }

  #Method to check if username or password is empty
  def has_username_and_password
    if self.userid == ""
      return false
    elsif self.password == ""
      return false
    end
      return true
  end

  #Method to check confirmation password against password fields
  def confirmation_password(conPass, pass)
    if conPass != pass
      return false
    end
      return true
  end

  #Method to check if the user already exists in the database
  def already_exists(username, userpass)
    user = User.find_by_userid(username)
    #Return 1 if found, 0 if only username is taken, -1 if not found at all
    if user
      if user.password == userpass
        return 1
      else
        return 0
      end
    else
      return -1
    end
  end

end
