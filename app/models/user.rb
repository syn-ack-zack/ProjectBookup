class User < ActiveRecord::Base
recommends :books
    validates :userid, presence:true, length: { minimum: 3}, uniqueness: { case_sensitive: false}
    validates :password, presence:true, length: {minimum: 5, maximum: 35}

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
