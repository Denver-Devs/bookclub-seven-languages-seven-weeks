# Print the contents of an array of sixteen numbers, four numbers at a time, using just each. Now, do the same with each_slice in Enumerable.

puts
puts '## each'
puts

(1..16).each do |x|
  print x
  puts if x % 4 == 0 # put newline
end

# Now, do the same with each_slice in Enumerable.

puts
puts '## each_slice'
puts
(1..16).each_slice(4) {|a| p a}
