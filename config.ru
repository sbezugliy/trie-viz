# frozen_string_literal: true

ENV["RACK_ENV"] ||= "development"

$LOAD_PATH.unshift File.expand_path(__dir__)
require 'rubygems'
require 'sinatra'
require 'trie/viz'

require 'trie/application/web'

run Rack::URLMap.new '/' => Web.new
