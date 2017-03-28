# Find out how to access files with and without code blocks. What is the benefit of the code block?

filename = 'test.txt'

# BLOCK STYLE
# don't have to close the file
File.open(filename, 'w') do |f|
  f.puts 'Mary had a little lamb'
end

# non-block style.
append_to_file = File.open(filename, 'a')
append_to_file.puts 'a little ram'
append_to_file.puts 'a little spam'
append_to_file.close
