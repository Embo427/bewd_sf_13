require 'pry'
require 'pry-byebug'

def awesome(num) #awesome is a method that requires an argument
  #using if/else to determine what to do
  if num % 3 == 0 && num % 5 == 0 #using modulos to determine whether the number is divisible by 3, 5 or both
    puts "Awesome"
  elsif num % 3 == 0
    puts "Awe"
  elsif num % 5 == 0
    puts "Some"
  else
    puts "This number is #{num}. It is not completely awesome" #using interpolation to insert variables into strings
  end
end

# awesome(17) #calling the awesome method and passing an integer to test

def awesome_seeker(number) #awesome_seeker is a method that requires an argument
  1.upto(number) do |num| #using the upto method, starting at 1 and incrementing up to the argument we've passed. iterate through each instance of num
    awesome(num) #call the awesome method for each instance of num
  end
end

awesome_seeker(100) #call the awesom_seeker method and pass 10 as the upper bound of upto
