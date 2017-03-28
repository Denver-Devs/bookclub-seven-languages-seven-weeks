# The Tree class was interesting, but it did not allow you to specify a new tree with a clean user interface. Let the initializer accept a nested structure with hashes and arrays. You should be able to specify a tree like this: {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }.

class Tree
  attr_accessor :children, :name

  def initialize(hash)
    @name, children = hash.first
    @children = children.map do |k, v|
      Tree.new({k => v})
    end
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block) 
    block.call self
  end
end

ruby_tree = Tree.new({'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } })
puts "Visiting a node"
ruby_tree.visit {|node| puts node.name}
puts
puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.name}
