class AddConstraintsToUsers < ActiveRecord::Migration
  def change
     change_column :users, :userid, :string, :null => false
     change_column :users, :password, :string, :null => false
     change_column :books, :name, :string, :null => false
     change_column :books, :author, :string, :null => false
  end
end
