# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'tss/tss'
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

  set :views, File.expand_path('views', __dir__)
  set :haml, format: :html5

  get '/' do
    haml :'/index'
  end

  get '/dictionary' do
    haml :'/dictionary'
  end

  post '/dictionary' do
    image_name = 'trie.png'
    diagram_path = File.join(settings.public_folder, 'images', image_name)
    dictionary = dict_to_arr(params[:dictionary])
    pp dictionary
    tss = TSS::Trie.new(dictionary, :full)

    inclusions = tss.parse(params[:text]) if params[:text]

    TrieViz::Diagram.new(tss.root, diagram_path)

    haml :'/result', locals: {
      data: {
        dictionary: dictionary,
        text: params[:text]
      },
      result: {
        diagram_path: 'images/' + image_name,
        inclusions: inclusions
      }
    }
  end

  private

  def dict_to_arr(dict)
    dict.scan(/(?:[^\\\s]|\\.)+/).map{ |s| s.gsub('\ ', ' ') }
  end
end
