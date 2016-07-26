helpers do
  def logged_in?
    p session[:id].present?
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
end
