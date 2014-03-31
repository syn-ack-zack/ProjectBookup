class CreateBookupDB < ActiveRecord::Migration
  def create
    create_table: book { |table| 
      table.string: isbn
      table.string: name
      table.string: author
      table.string: genre
      table.timestamps
    }
  end
end

