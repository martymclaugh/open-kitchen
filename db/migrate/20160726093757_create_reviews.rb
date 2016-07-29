class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id, presence: true
      t.integer :restaurant_id, presence: true
      t.string :title, presence: true
      t.string :content, presence: true
      t.string :value, presence: true
      t.timestamps null: false
    end
  end
end
