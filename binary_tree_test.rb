gem 'minitest', '~> 5.0'
require 'minitest/autorun'

require_relative 'binary_tree'

class BinaryTreeTest < Minitest::Test
  def test_null_tree
    b = BinaryTree.create(nil)
    assert_equal b.value, nil.to_s
    assert_nil b.left
    assert_nil b.right
  end

    def test_one_element_tree
        b = BinaryTree.create([2])
        assert_equal b.value, "2"
        assert_nil b.left
        assert_nil b.right
    end

    def test_three_element_tree
        b = BinaryTree.create([ 1, 2, 3 ])
        assert_equal b.value, "2"
        assert b.left != nil
        assert b.right != nil
        assert_equal b.left.value, "1"
        assert_equal b.right.value, "3"
        assert_nil b.left.left
        assert_nil b.left.right
        assert_nil b.right.left
        assert_nil b.right.right
    end
end