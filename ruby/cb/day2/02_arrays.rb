# You can use Ruby arrays as stacks. What other common data structures do arrays support?
# "You can use an array as a queue, a linked list, a stack, or a set."

## Stack

puts "\nSTACK OPERATIONS\n\n"
stack = []

stack.push('harper')
stack.push('biden')
stack.push('alaska')

puts stack.pop
puts stack.pop
puts stack.pop

## Set

puts "\nSET OPERATIONS\n\n"
set = []
set << 'apple' << 'orange' << 'apple' << 'pear' << 'apple'
puts set.uniq

## Queue

puts "\nQUEUE OPERATIONS\n\n"
queue = []
queue.push('one')
queue.push('two')
queue.push('three')
puts queue.shift
puts queue.shift
puts queue.shift

## Linked List
# todo: impliment a linked list
