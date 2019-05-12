$:.unshift File.expand_path("../", __FILE__)
require 'rubygems'
require 'sinatra'
require 'trie/viz'

require 'trie/application/web'

run Rack::URLMap.new "/" => Web.new
