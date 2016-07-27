class Restaurant < ActiveRecord::Base
  # Remember to create a migration!
  has_many :reviews
  has_many :users, through: :reviews
end
