require 'sinatra/base'
require_relative 'data_mapper_setup'

class ChitterScript < Sinatra::Base
  get '/' do
    @user = User.first(id: session[:user_id])
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end

require_relative 'controllers/user_management'
require_relative 'controllers/cheeping'