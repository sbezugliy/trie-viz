# frozen_string_literal: true

require 'trie/viz/version'
require 'graphviz'
##
# Main module
module TrieViz
  ##
  # Visualization class
  class Diagram
    attr_reader :trie

    def initialize(_trie)
      g = Graphviz.new
    end
  end
end
