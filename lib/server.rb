require 'sinatra/base'
require 'sinatra/reloader'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

# we're telling datamapper to use a postgres database on localhost.
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/link' # this needs to be done after datamapper is initialised

# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!

class Bookmarker < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "hello word"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end