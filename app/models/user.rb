class User < ActiveRecord::Base
  include BCrypt
  validates :full_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  has_many :reviews
  has_many :restaurants, through: :reviews

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    if user && user.password == password
      user
    else
      nil
    end
  end
end
