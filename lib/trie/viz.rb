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
      root = @graph.add_nodes("<root>")
      @trie.children.each do |vertex|
        p = @graph.add_nodes(vertex.char)
        @graph.add_edges(root, p)
        add_row(p, vertex)
      end
      @graph.output(png: @image_path)
    end

    def add_row(node, vertex)
      vertex.children.each do |vertex2|
        c = @graph.add_nodes(vertex2.char)
        @graph.add_edges(node, c)
        add_row(c, vertex2)
      end
    end
  end
end
