class User < ActiveRecord::Base
recommends :books
    validates :userid, :presence => true, length: { minimum: 5}, uniqueness: { case_sensitive: false}, format: { without: /\s/ }
    validates :password, :presence => true, length: {minimum: 5, maximum: 35}, format: { without: /\s/ }

  def has_username_and_password
    if self.userid == ""
      return false
    elsif self.password == ""
      return false
    end
      return true
  end

  def confirmation_password(conPass, pass)
    if conPass != pass
      return false
    end
      return true
  end

  def already_exists(username, userpass)
    user = User.find_by_userid(username)
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
