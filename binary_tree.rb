require 'bundler'

Bundler.require(:default)

class BinaryTree
  attr_reader :left
  attr_reader :right
  attr_reader :value

  def initialize(left, right, value)
    @left = left
    @right = right
    @value = value.to_s
  end

  def self.create(array)
    ### tutaj umiesc swoj kod
    if array != nil
      array.sort!
      if array.length > 1
        mid_elem = array.length/2
        value = array[mid_elem]
        left = BinaryTree.create(array.select { |a| a < array[mid_elem]})
        if array.select { |a| a > array[mid_elem]}.length > 0
          right = BinaryTree.create(array.select { |a| a > array[mid_elem]})
        end
      else
        value = array[0]
        left = nil
        right = nil
      end
    else
      value = nil
      left = nil
      right = nil
    end
    new(left, right, value)
  end

  def generate_graph_tree
    graph = GraphViz.new(:G, type: :graph)
    generate_graph_subtree(graph)
    graph
  end

  def generate_graph_subtree(graph)
    this_node = graph.add_nodes(value)
    if left
      left_node = left.generate_graph_subtree(graph)
      graph.add_edges(this_node, left_node)
    end
    if right
      right_node = right.generate_graph_subtree(graph)
      graph.add_edges(this_node, right_node)
    end
    this_node
  end

  def print_tree(file)
    generate_graph_tree.output(png: file)
  end
end
