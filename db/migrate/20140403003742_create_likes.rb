class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.timestamp :dateliked
      t.string :textreview
      t.boolean :likeordislike

      t.timestamps
    end
  end
end
