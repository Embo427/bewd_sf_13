require_relative "stacklike" #require and load take strings as arguments, whereas include takes name of a module in the form of a constant
class Stack
  include Stacklike
end

s = Stack.new
s.add_to_stack("item one")
s.add_to_stack("item two")
s.add_to_stack("item three")
puts "Objects currently on the stack:"
puts s.stack
taken = s.take_from_stack
puts "Removed this object:"
puts taken
puts "Now on stack:"
puts s.stack
