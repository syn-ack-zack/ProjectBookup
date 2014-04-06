class User < ActiveRecord::Base
    recommends :books, :authors
end
