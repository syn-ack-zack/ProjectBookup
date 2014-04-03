class AddConstraintsToUsers < ActiveRecord::Migration
  def change
     change_column :users, :userid, :integer, :null => false
     change_column :users, :name, :string, :null => false
     change_column :users, :password, :string, :null => false
     change_column :books, :name, :string, :null => false
     change_column :books, :author, :string, :null => false
     change_column :likes, :dateliked, :timestamp, :null => false
     change_column :likes, :likeordislike, :boolean, :null => false
  end
end
