require 'sinatra/base'

require_relative './models/link.rb'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :links_new
  end

  post '/links' do
    Link.create(params[:title], params[:url])
    redirect '/links'
  end

  run! if app_file == $0
end
