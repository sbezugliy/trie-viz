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
    attr_reader :graph
    attr_reader :image_path

    def initialize(trie, image_path)
      @trie = trie
      @image_path = image_path
      build
    end

    private

    def build
      @graph = GraphViz.new(:G, type: :digraph)
      add_row(@trie)
      @graph.output(png: @image_path)
    end

    def add_row(vertex)
      vertex.children.each do |vertex|
        @graph.add_nodes(vertex.char)
        vertex.children.each do |vertex2|
          @graph.add_nodes(vertex2.char)
          add_row(vertex2)
        end
      end
    end
  end
end
