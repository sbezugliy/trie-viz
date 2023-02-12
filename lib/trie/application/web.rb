# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'tss/tss'
require 'trie/viz'
require 'haml'
require 'benchmark'

configure { set :server, :puma }
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
  set :slim, format: :html

  set :results, {}

  set :flash, {}

  after do
    settings.flash = {}
  end

  get '/', provides: :html do
    slim(:index).to_s
  end

  get '/principals', provides: :html do
    slim :principals
  end

  get '/dictionary', provides: :html do
    slim :dictionary
    raise "Test newrelic"
  end

  get '/render_3d', provides: :html do
    slim :render_3d
  end

  post '/dictionary', provides: :html do
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
        dictionary:,
        text: params[:text]
      },
      result: {
        diagram_path: "images/#{image_name}",
        inclusions: @inclusions
      },
      benchmark: {
        build: bm_build,
        parse: bm_parse
      }
    }
    slim :'/result', locals: @results
  rescue RuntimeError => e
    settings.flash[:message] = "#{e.class}. Please check fields"
    slim :dictionary, locals: {
      results: @results
    }
  end

  private

  def dict_to_arr(dict)
    dict.split(/(?<!\\); /).map { |s| s.gsub('\\;', ';') }
  end
end
