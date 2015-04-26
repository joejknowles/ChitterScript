require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'helpers/users'

class ChitterScript < Sinatra::Base
  helpers Users

  get '/' do
    @cheeps = Cheep.all
    @user = User.first(id: session[:user_id])
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end

require_relative 'controllers/user_management'
require_relative 'controllers/cheeping'
require_relative 'controllers/smiling'