#Print the contents of an array of sixteen numbers, four numbers at a time, using just each. Now, do the same with each_slice in Enumerable.
puts

a = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]

a.each { |x| puts a[a.index(x)-3..a.index(x)].to_s if (a.index(x) + 1) % 4 == 0 }
a.each_slice(4) {|x| puts "#{x}"}


#The Tree class was interesting, but it did not allow you to specify a new tree with a clean user interface. Let the initializer accept a nested structure with hashes and arrays. You should be able to specify a tree like this: {’grandpa’ => { ’dad’ => {’child 1’ => {}, ’child2’ => {} }, ’uncle’ => {’child 3’ => {}, ’child 4’ => {} } } }.
puts

class Tree
	attr_accessor :children, :node_name
	
	def initialize(args={})		
		args.each_pair do | key, value | 
			@node_name = key
			@children = []
			value.each { | k, v | @children.push(Tree.new(k => v))  }
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

ruby_tree = Tree.new( {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } } )

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts
puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}


#Write a simple grep that will print the lines of a file having any occurrences of a phrase anywhere in that line. You will need to do a simple regular expression match and read lines from a file. (This is surprisingly simple in Ruby.) If you want, include line numbers.

def grepp(file, string)	
	File.open(file) do |f|
		line = 0
		f.each_line do |l|
			line+=1
			puts "line #{line}: #{l}" if l.include? string
		end
	end
end

puts "checking day2.txt for the string 'Code'..."
grepp('day2.txt', 'Code')
