require 'helper'

class BinarySearchTreeTest < TestCase

  setup do
    @tree = BinarySearchTree.new
  end

  test 'can add root the element to the tree' do
    @tree.add("hello")
    assert @tree.contains?("hello")
  end

  test 'detects if an element exists in the tree' do
    assert_not @tree.contains?("hello")

    @tree.add("hello, world")
    @tree.add("hello, there")
    @tree.add("goodbye")

    assert_not @tree.contains?("hello")

    @tree.add("hello")

    assert @tree.contains?("hello")
  end

  test 'calculates the height of the tree' do
    assert_equal 0, @tree.height

    @tree.add("hello")
    assert_equal 1, @tree.height

    @tree.add("world")
    assert_equal 2, @tree.height
  end

  test 'it balances the tree when inserting right' do
    @tree.add("hello")
    @tree.add("hello, there")
    @tree.add("hello, world")

    assert_equal 2, @tree.height
  end

  test 'it balances the tree when inserting left' do
    @tree.add("hello, world")
    @tree.add("hello, there")
    @tree.add("hello")


    assert_equal 2, @tree.height
  end

  test 'calculates the number of elements in the tree' do
    @tree.add("hello")
    @tree.add("hello, there")
    @tree.add("hello, world")

    assert_equal 3, @tree.size
  end

  # more test cases
  test 'test non-string input' do
    @tree.add(10)
    assert_nil @tree.root
  end

  test 'test duplicate element' do
    @tree.add("hello")
    @tree.add("hello")
    @tree.add("hello")

    assert_equal 1, @tree.size
  end

  test 'test left rotate' do
    @tree.add("a")
    @tree.add("b")
    @tree.add("c")
    left_rotate(bst.root)

    assert_equal 1, @tree.size
  end

  test 'test right rotate' do
    @tree.add("hello")
    @tree.add("hello")
    @tree.add("hello")

    assert_equal 1, @tree.size
  end

