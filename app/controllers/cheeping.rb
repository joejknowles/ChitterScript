class ChitterScript < Sinatra::Base
  post '/cheeps/new'  do
    params
    erb :cheep
  end
end