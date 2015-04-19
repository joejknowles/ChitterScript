
class ChitterScript < Sinatra::Base
  enable :sessions
  post '/users/new' do
    @user = User.new(username: params['username'],
                     password: params['password'])
    unless @user.save
      # if sign up fails
      halt 401, @user.errors.full_messages[0]
    end
    session[:user_id] = @user.id
    erb :welcome, layout: false
  end

  post '/sessions/new' do
    @user = User.authenticate(params['username'], params['password'])
    halt 401, "Incorrect username or password" unless @user
    session[:user_id] = @user.id
    erb :welcome_back, layout: false
  end

  post '/sessions/end' do
    @user = User.first(id: session[:user_id])
    session[:user_id] = nil
    erb :bye, layout: false
  end
end