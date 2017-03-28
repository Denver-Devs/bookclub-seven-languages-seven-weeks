# Write a simple grep that will print the lines of a file having any occurrences of a phrase anywhere in that line. You will need to do a simple regular expression match and read lines from a file. (This is surprisingly simple in Ruby.) If you want, include line numbers.

lines = File.readlines('test.txt')

puts 'LAMB'
puts lines.grep(/lamb/)
puts
puts 'LITTLE'
puts lines.grep(/little/)
