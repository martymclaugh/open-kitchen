post '/register' do
  p params
  if params[:password1] == params[:password2]
    user = User.create(username: params[:username], full_name: params[:full_name], email: params[:email], password: params[:password2])
    if user
      redirect '/'
    end
  else
    if params[:password1] == params[:password2]
      @register_error = "*Passwords don't match"
    end
    redirect '/'
  end
end

get '/logout' do
  logout
  redirect '/'
end

post '/login' do
  user = User.authenticate(params[:username], params[:password])
  if user
    login(user)
    redirect '/profile'
  else
    @login_error = "*Wrong username or password"
    p @login_error
    redirect '/'
  end
end
