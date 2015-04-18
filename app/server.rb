require 'sinatra/base'

class ChitterScript < Sinatra::Base
  get '/' do
    'Hello ChitterScript!'
  end

  run! if app_file == $PROGRAM_NAME
end
