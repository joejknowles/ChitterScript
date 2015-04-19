require 'data_mapper'
env = ENV['RACK_ENV'] || 'development'
local = "postgres://localhost/chitterscript_#{env}"
DataMapper.setup(:default, local)
require_relative 'models/user'
DataMapper.finalize