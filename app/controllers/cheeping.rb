class ChitterScript < Sinatra::Base
  post '/cheeps/new'  do
    @user = User.first(id: session[:user_id])
    cheep = Cheep.create(message: params['cheep'],
                         created_at: Time.now,
                         user: @user)
    erb :cheep, layout: false, locals: { cheep: cheep }
  end
end