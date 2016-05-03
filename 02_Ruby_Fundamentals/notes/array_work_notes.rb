colors = %w{red white blue}
letters = %w{a a b c d d e f}

#size
puts "The size method tells us the number of elements in an array, i.e. the colors array has #{colors.size} elements"

#push/<<
puts "The push method appends new values to the end of the array"
puts colors
new_colors = colors.push("green","yellow")
puts new_colors

#pop
puts "The pop method removes the last element from an array and returns it"
newer_colors = new_colors.pop
puts newer_colors
puts new_colors

#unshift
puts "The unshift method adds objects to the front of an array"
new_colors.unshift("orange")
puts new_colors

#shift
puts "The shift method removes the first element of an array and returns it"
first_color = new_colors.shift
puts first_color
first_two_colors = new_colors.shift(2)
puts first_two_colors

#uniq
puts "The uniq method removes duplicates and returns unique values"
puts letters
unique_letters = letters.uniq
puts unique_letters

#include?
puts "The include? method returns true or false if an object passed exists in the array"
puts unique_letters.include?('g')
