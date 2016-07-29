class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.string :yelp_reviews
      t.timestamps null: false
    end
    add_index :restaurants, [:restaurant_name, :address], unique: true
  end
end
