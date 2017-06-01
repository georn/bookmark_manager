ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
   "YO"
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :links_new
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(tag_name: params[:tag_name])
    link.tags << tag
    link.save
    redirect '/links'
  end

  run! if app_file == $0
end
