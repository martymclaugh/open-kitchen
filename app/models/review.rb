class Review < ActiveRecord::Base
  # Remember to create a migration!
  validates :user_id, presence: true
  validates :restaurant_id, presence: true
end
