obj = Object.new

def obj.talk
  puts "I am an object."
  puts "{Do you object?}"
end

def obj.c2f(c)
  c * 9.0 / 5 + 32
end

# puts obj.c2f(100)

puts "The id of obj is #{obj.object_id}."
str = "Strings are objects too, and this is a string!"
puts "The id of the string object str is #{str.object_id}."
puts "And the id of the integer 100 is #{100.object_id}"

a = Object.new
b = a
puts "a's id is #{a.object_id} and b's id is #{b.object_id}."
