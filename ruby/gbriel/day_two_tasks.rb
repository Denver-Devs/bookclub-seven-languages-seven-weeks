hash = {:one => 1, :two => 2, :three => 3}
puts "hash: #{hash}"
array = []
hash.each_value {|value| array.push(value)}
puts "array: #{array}"
hash = hash.values
puts "hash: #{hash}"
puts "End Task 1.1\n\n"

hash = {:one => 1, :two => 2, :three => 3}
puts "hash: #{hash}"
hash = hash.to_a
puts "hash: #{hash}"
hash = hash.to_h
puts "hash: #{hash}"
puts "End Task 1.2\n\n"

hash.each {|key, value| puts "key: #{key}, value: #{value}"}
puts "End Task 2\n\n"

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
puts "array: #{array}"
def print_array(argument)
  a = 0
  b = 3
  c = argument.length
  blank_array = []
  until b >= c
    argument[a..b].each {|item| blank_array.push(item)}
    puts "#{blank_array}"
    a = a + 4
    b = b + 4
    blank_array.clear
  end
end
print_array(array)
puts "End Task 3\n\n"
