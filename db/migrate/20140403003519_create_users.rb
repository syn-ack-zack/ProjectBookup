class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :userid
      t.string :name
      t.string :password
      t.string :favbook
      t.text :aboutme
      t.string :favauthor
      t.string :favgenre

      t.timestamps
    end
  end
end
