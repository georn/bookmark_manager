ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(tag_name: params[:tag_name])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/tags/:tag_name' do
    tag = Tag.first(tag_name: params[:tag_name])
    @links = tag ? tag.links : []
    p @links
    erb :'links/index'
  end

  run! if app_file == $0
end
