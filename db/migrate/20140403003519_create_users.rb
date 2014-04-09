class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userid
      t.string :password
      t.string :favbook
      t.text :aboutme
      t.string :favauthor
      t.string :favgenre

      t.timestamps
    end
  end
end
