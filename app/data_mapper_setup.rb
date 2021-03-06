require 'data_mapper'
env = ENV['RACK_ENV'] || 'development'
local = "postgres://localhost/chitterscript_#{env}"
DataMapper.setup(:default, local)
require_relative 'models/user'
require_relative 'models/cheep'
require_relative 'models/smile'
DataMapper.finalize
DataMapper.auto_upgrade!