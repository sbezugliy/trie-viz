# frozen_string_literal: true

require 'sinatra'
require 'trie/viz'
require 'haml'

##
# Web application starter class
class Web < Sinatra::Base
  set :static, true
  set :public, File.expand_path(__dir__)

  set :views,  File.expand_path('views', __dir__)
  set :haml, format: :html5

  get '/' do
    haml :'/index'
  end

  get '/dictionary' do
    haml :'/dictionary'
  end

  get '/dictionary' do
    pp params
  end

end
