class CreateReviews < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.string :title
      t.string :content
      t.string :value
    end
  end
end
