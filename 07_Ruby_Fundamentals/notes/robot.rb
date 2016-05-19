require 'pry'
require 'pry-byebug'

class Robot
  attr_accessor :name, :origin, :type

  def initialize(name, origin, type="beta")
    @name = name
    @origin = origin
    @type = type
  end

  def flying_skills
    puts "My name is #{name}. I have flying skills"
  end

end

robot = Robot.new("Emmett","Boston","Android")
robot.flying_skills
