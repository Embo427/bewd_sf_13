def change_string(str)
  str.replace("New string content!")
end

# s = "Original string content!"
# change_string(s)
# puts s

# s = "Original string content!"
# change_string(s.dup)
# puts s

# s = "Original string content!"
# s.freeze
# change_string(s)

numbers = ["one","two","three"]
numbers.freeze
# numbers[2] = "four" -- Can't modify frozen array
numbers[2].replace("four")
puts numbers
