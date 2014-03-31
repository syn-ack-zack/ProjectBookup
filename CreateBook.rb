class CreateBookupDB < ActiveRecord::Migration
  def change
    create_table "book", force=> true { |table| 
      table.string: isbn
      table.string: name
      table.string: author
      table.string: genre
      
      # table.timestamps
    }
  end

  def change1
    create_table "user", force=> true do |true|
      # table.integer:  userid AUTOMATIC
      table.string: name
      table.string: password #NEEDS ENCRYPTED
    end
  end

  def change2
    create_table "profile", force=> true do |true|
      # table.integer:  User ID
      table.string: favorite_book # ISBN
      table.string: favorite_author
      table.string: favorite_genre
    end
  end

  def change3
    create_table "like", force=> true do |true|
      # table.integer: userid
      table.string: isbn
      table.timestamps: date
      table.stirng: review
    end
  end

end

  