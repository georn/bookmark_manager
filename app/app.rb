ENV["RACK_ENV"] ||= 'development'

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
    Link.create(title: params[:title],url: params[:url])
    redirect '/links'
  end

  run! if app_file == $0
end
