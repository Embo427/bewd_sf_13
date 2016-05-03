@name = "Emmett"
@name_whitespace = "   Emmett   "
@last_name = "Patton "

#Length method
def length_method(input_string)
  puts "The length method tells us how long the name variable, #{input_string} is."
  puts "For example, #{input_string} is #{input_string.length} letters."
end

#Prepend method
def prepend_method(input_string)
  puts "The prepend method adds the input_string, in this case #{input_string}, to the beginning of another string."
  puts "For example, #{@last_name.prepend(input_string)}"
end

#Append method
def append_method(input_string)
  puts "The append method adds the input_string, in this case #{input_string}, to the end of another string."
  puts "For example, #{@name << input_string}"
end

#Strip method
def strip_method(input_string)
  puts "The strip method removes leading and/or trailing white space to a string."
  puts "For example, #{input_string} becomes #{input_string.strip}"
end

#Chars method
def chars_method(input_string)
  puts "The chars method returns an array of characters in the string."
  puts "For example, #{input_string.chars}"
end

length_method(@name)
# prepend_method(@name)
# append_method(@last_name)
# strip_method(@name_whitespace)
# chars_method(@name)
