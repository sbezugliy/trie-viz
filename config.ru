#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/setup'
require 'trie/viz'

require 'trie/application/web'

run Rack::URLMap.new "/" => Web.new
