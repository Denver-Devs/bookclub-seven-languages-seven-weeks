puts 'First'
array = *0..15
array.each { |i| puts "#{i} #{i + 1} #{i + 2} #{ i + 3}" if i % 4 == 0}
array.each_slice(4) {|a| p a}
puts

puts 'Second'
class Tree
    attr_accessor :children, :node_name

    def initialize(hash)
        hash.each do |key, value|
            @node_name = key;
            @children = value.inject([]) do |array, child|
                array.push(Tree.new({child[0] => child[1]}))
            end
        end
    end

    def visit_all(&block)
        visit &block
        children.each { |c| c.visit_all &block }
    end

    def visit(&block)
        block.call self
    end
end

ruby_tree = Tree.new(
    { 'grandpa' =>
        {
            'dad' => {
                'Ben' => {},
                'Max' => {},
                'Jeff' => {},
                'Rik' => {},
            },
            'Nufo' => {
                'Maxine' => {}
            }
        }
    })

puts "Visiting a node"
ruby_tree.visit { |node| puts node.node_name }
puts
puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name }
puts

puts 'Third'

def grep(file_name, text)
    puts text
    IO.foreach(file_name).with_index { |line, i| puts "#{i}: #{line}" if line.match text}
    puts
end

grep('textFile', 'this')
grep('textFile', 'the')