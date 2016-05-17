require 'pry'
require 'pry-byebug'

class Person

  #sets read & write privileges. getter & setter
  attr_accessor :name, :age, :home_town

  #these attributes are required. if not provided
  #the instance of the class will not be created
  def initialize(name, age, home_town)
    @name = name #instance variable. available everywhere in the class
    @age = age
    @home_town = home_town
  end

  def coding_skills
    if home_town == "San Francisco"
      "I have coding skills"
    else
      "I have been deprived"
    end
  end

  def self.assess_skills(people)
    people.each {|person| puts person.coding_skills}
  end

  def to_s
    "Hey! I am a Person. My name is #{@name}. I am from #{home_town}!"
  end
end

#instantiation
person = Person.new("Emmett", 28, "Lexington")
person_2 = Person.new("Ben", 31, "Waltham")
person_sf = Person.new("Jane", 97, "San Francisco")
people = []
people.push(person, person_2, person_sf)

Person.assess_skills(people)
