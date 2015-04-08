require 'sinatra/base'
require 'sinatra/reloader'
require 'data_mapper'

class Bookmarker < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @links = Link.all
    erb :index
  end

  post '/links' do
    url = params['url']
    title = params['title']
    Link.create(url: url, title: title)
    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end