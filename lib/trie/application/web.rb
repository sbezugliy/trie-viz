# frozen_string_literal: true

require 'sinatra'
require "sinatra/reloader" if development?
require 'trie/viz'
require 'haml'

##
# Web application starter class
class Web < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  set :static, true
  set :public_folder, File.expand_path(__dir__)

  set :views,  File.expand_path('views', __dir__)
  set :haml, format: :html5

  get '/' do
    haml :'/index'
  end

  get '/dictionary' do
    haml :'/dictionary'
  end

  post '/dictionary' do
    pp params
    haml :'/result', locals: {data: params}
  end

end
