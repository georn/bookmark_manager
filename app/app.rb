ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'

require_relative './models/link.rb'
require_relative './models/tag.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
   "YO"
  end

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    erb :links
  end

  get '/links/new' do
    erb :links_new
  end

  post '/links' do
    Link.create(title: params[:title],url: params[:url])
    Tag.create(tag_name: params[:tag_name])
    redirect '/links'
  end

  run! if app_file == $0
end
