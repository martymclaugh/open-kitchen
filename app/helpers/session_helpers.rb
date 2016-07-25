helpers do
  def logged_in?
    session[:id].present?
  end

  def login(user)
    session[:id] = user.id
  end

  def logout
  	session[:id] = nil
  end

  def current_user
    @user = User.find(session[:id])
  end
  # def client
  #   Yelp.client.configure do |config|
  #     config.consumer_key = YOUR_CONSUMER_KEY
  #     config.consumer_secret = YOUR_CONSUMER_SECRET
  #     config.token = YOUR_TOKEN
  #     config.token_secret = YOUR_TOKEN_SECRET
  #   end
  # end
end
