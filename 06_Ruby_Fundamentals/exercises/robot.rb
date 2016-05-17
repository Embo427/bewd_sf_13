#Classes have state and behavior
#State & Object Factory: factory that creates and instiantes robots
#Behavior: Collection of class methods, instance methods, instance variable, local variables, constants etc.,

#Instructions:
# A class that makes robots with information given
# Another class that makes a random robot, with no information given
# Create a sample within random robot maker using an array
# Three names, three potential origins, randomly create robots with those things
# Give certain robots certain skills, other robots other skills
# Print out a blurb about each robot

require 'pry'
require 'pry-byebug'

class Robot

  #creates getter && setter methods for each attribute
  attr_accessor :name, :type, :origin

 #instance_factory to support creating a new robot using Robot.new
  def initialize(name,type, origin)
    @name = name
    @type = type
    @origin = origin
  end

  #class methods can be called outside of the class like Robot.make_robots(number)
  def self.make_robots(number)
    self.random_robot_maker(number)
  end

  def self.random_robot_maker(num_robots)
    robots = {}

    names = ["Wall-E","R2D2","C-3P0","BB-8"]
    types = ["small","medium","large"]
    origins = ["Earth","Pluto","Mars","Jupiter"]

    1.upto(num_robots) do |robot|
      name = names.sample
      type = types.sample
      origin = origins.sample

      new_robot = Robot.new(name, type, origin)
      robot_details = {name: name, type: type, origin: origin}

      new_robot.empathy(new_robot, robot_details)
      new_robot.flying_skills(new_robot, robot_details)
      new_robot.laser_fighting_skills(new_robot, robot_details)
      robots["#{robot}"] = robot_details
    end

    robots.each do |k,v|
      if v[:empathy] == "no"
        empathy = "I have no empathy"
      else
        empathy = "I have empathy"
      end
      if v[:flying_skills] == "no"
        fly = "I cannot fly"
      else
        fly = "I can fly"
      end
      if v[:laser_fighting_skills] == "no"
        lasers = "and I cannot shoot lasers"
      else
        lasers = "and I can shoot lasers"
      end
      puts "I am #{v[:name]}! I am a #{v[:type]}-size robot from #{v[:origin]}. #{empathy}, #{fly}, #{lasers}."
    end

  end
  # this method randomly selects name type and origin from three different arrays that we define
  # also needs to assign random skills, based on methods below

  #instance methods can only be called by instances of a class
  def empathy(new_robot, robot_details)
    if new_robot.type == "small"
      robot_details[:empathy] = "yes"
    else
      robot_details[:empathy] = "no"
    end
  end

  #this is an instance method
  def flying_skills(new_robot, robot_details)
    if new_robot.origin == "Pluto"
      robot_details[:flying_skills] = "yes"
    else
      robot_details[:flying_skills] = "no"
    end
  end

  def laser_fighting_skills(new_robot, robot_details)
    if new_robot.name == "Wall-E"
      robot_details[:laser_fighting_skills] = "yes"
    else
      robot_details[:laser_fighting_skills] = "no"
    end
  end
end

Robot.make_robots(5)
