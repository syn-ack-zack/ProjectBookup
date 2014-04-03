class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :name
      t.string :author
      t.string :genre

      t.timestamps
    end
  end
end
