# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'tss/tss'
require 'trie/viz'
require 'haml'
require 'benchmark'

##
# Web application starter class
class Web < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end
  set :static, true
  set :public_folder, File.expand_path(__dir__)

  set :views, File.expand_path('views', __dir__)
  set :haml, format: :html5

  set :results, {}

  set :flash, {}

  after do
    settings.flash = {}
  end

  get '/' do
    haml :'/index'
  end

  get '/principals' do
    haml :'/principals'
  end

  get '/dictionary' do
    haml :'/dictionary'
  end

  post '/dictionary' do
    image_name = 'trie.png'
    diagram_path = File.join(settings.public_folder, 'images', image_name)
    dictionary = dict_to_arr(params[:dictionary])
    @tss = nil
    @inclusions = nil
    bm_build = Benchmark.measure do
      @tss = TSS::Trie.new(dictionary, :full)
    end
    bm_parse = Benchmark.measure do
      @inclusions = @tss.parse(params[:text]) if params[:text]
    end
    TrieViz::Diagram.new(@tss.root, diagram_path)

    @results = {
      data: {
        dictionary: dictionary,
        text: params[:text]
      },
      result: {
        diagram_path: 'images/' + image_name,
        inclusions: @inclusions
      },
      benchmark: {
        build: bm_build,
        parse: bm_parse
      }
    }
    haml :'/result', locals: @results
  rescue RuntimeError => e
    pp e.message
    settings.flash[:message] = "#{e.class}. Please check fields"
    haml :'/dictionary', locals: {
      results: @results
    }
  end

  private

  def dict_to_arr(dict)
    dict.split(/(?<!\\); /).map{|s| s.gsub('\\;', ';')}
  end
end
