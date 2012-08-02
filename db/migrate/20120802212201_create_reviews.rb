class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.string :comment
      t.integer :star_rating

      t.timestamps
    end
  end
end
