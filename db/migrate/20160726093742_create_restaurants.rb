class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :phone
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :yelp_reviews
      t.timestamps
    end
    add_index :restaurants, [:name, :address1], unique: true
  end
end
