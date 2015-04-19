class ChitterScript < Sinatra::Base
  post '/cheeps/new'  do
    @user = User.first(id: session[:user_id])
    @cheep = params['cheep']
    erb :cheep, layout: false
  end
end