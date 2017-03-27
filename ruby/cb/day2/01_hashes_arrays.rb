# How would you translate a hash to an array? Can you translate arrays to hashes?

my_hash = {:animal => 'dog', :color => 'black', :name => 'harper', :disposition => 'concerned'}

def hash_to_array hash
  hash.map {|k, v| [k, v]}
end

def array_to_hash array
  array.to_h
end

puts my_hash
puts hash_to_array my_hash
puts array_to_hash hash_to_array my_hash
