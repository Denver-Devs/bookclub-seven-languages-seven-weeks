# # Study
# 1. Find out how to access files with and without code blocks. What is the benefit of the code block?
#   * Use File.open and File.new to access and manipulate files
#   * File.open behaves like File.new if no block is supplied
#   * If a block is passed to File.open, the block value is used as ::open's return value and the file is automatically closed when block execution is complete
#   * If no block is supplied, the file is the return value but must be closed manually
# With a block:
file1 = File.open("file1.txt", 'r+') {|file|
    file.write("Writing to a file with a block")
    # File.open returns the value of its block if a block is supplied
    # you can return the file object so that it can be referenced outside of the block
    file
}
puts "file1"
File.foreach(file1) {|line| puts "#{line}" }

# With no block:
# File.open returns the file object if no block is supplied
file2 = File.open("file2.txt", 'r+')

3.times { file2.write("Writing to a file with no block\n") }

puts "file2"
File.foreach(file2) {|line| puts "#{line}" }

# The file must be closed manually if no block is used
file2.close
puts

# 2. How would you translate a hash to an array? Can you translate arrays to hashes?
#   * Hash -> Array (nested) - `myHash.sort`
myHash = {
    "first" => "Katie",
    "second" => "James",
    "third" => "Matthew",
}
p myHash.sort
puts

myArray = ["Katie", "James", "Matthew"]
#   * Array to Hash (keys)
p Hash[myArray.collect { |item| [item, ""] } ]
puts

#   * Array to Hash (values)
new_hash = {}
myArray.each_with_index { |o, i| new_hash[i] = o}
p new_hash
puts

# 3. Can you iterate through a hash? - `myHash.each`
new_hash.each {|i, v| puts "#{i}: #{v}"}
puts

# 4. You can use Ruby arrays as stacks. What other common data structures do arrays support?
# I had to google this one...
puts

# Print the contents of an array of sixteen numbers, four numbers at a time, using just each. Now, do the same with each_slice in Enumerable.
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
i = 1
numbers.each {|n|
    p numbers[i-3..i] if (i + 1) % 4 == 0
    i += 1
}
puts
numbers.each_slice(4) { |slice| puts "#{slice}" }

# The Tree class was interesting, but it did not allow you to specify a new tree with a clean user interface. Let the initializer accept a nested structure with hashes and arrays. You should be able to specify a tree like this: {’grandpa’ => { ’dad’ => {’child 1’ => {}, ’child 2’ => {} }, ’uncle’ => {’child 3’ => {}, ’child 4’ => {} } } }.

class Tree
    attr_accessor :children, :node_name
    def initialize(data)
        data.each {|name, children|
            @node_name = name
            @children = []
            if children && children.length
                children.each {|n, c|
                    @children << Tree.new(n => c)
                }
            end
        }
    end

    def visit()
        yield self
    end

    def visit_all(&block)
        visit &block
        children.each {|child| child.visit_all &block }
    end

end


fam = {
    "grandpa" => {
        "dad" => {
            "child 1" => {},
            "child 2" => {}
        },
        "uncle" => {
            "child 3" => {},
            "child 4" => {}
        }
    },
}
fam_tree = Tree.new(fam);
fam_tree.visit_all { |node| puts "#{node.node_name}" }


# Write a simple grep that will print the lines of a file having any occurrences of a phrase anywhere in that line. You will need to do a simple regular expression match and read lines from a file. (This is surprisingly simple in Ruby.) If you want, include line numbers.
begin
    puts "Enter the full name of the file you'd like to search" # file3.txt
    File.open(gets.chomp) { |f|
        puts "Enter the expression you'd like to search for" # test
        pattern = gets.chomp
        f.each_with_index { |l, i| puts "#{i}: #{l}" if l.match(pattern) }
    }
rescue SystemCallError
    puts "That file doesn't exist."
    exit(1)
end
