class User < ActiveRecord::Base
    recommends :books

    validates :userid, presence:true, length: { minimum: 3}
    validates :password, presence:true, length: {minimum: 5, maximum: 18}
    validates_uniqueness_of :userid
end
