env = ENV['RACK_ENV'] || 'development'

# we're telling datamapper to use a postgres database on localhost.
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require_relative 'models/link' # this needs to be done after datamapper is initialised

# After declaring your models, you should finalise them
DataMapper.finalize
