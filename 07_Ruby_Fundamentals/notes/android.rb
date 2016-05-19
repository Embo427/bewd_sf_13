require 'pry'
require 'pry-byebug'
require_relative 'robot'

class Android < Robot
  attr_accessor :name, :origin, :type

  def initialize(name, origin, type="android")
    super
  end

  def writing_skills
    puts "I have writing skills."
  end

  def singing_skills
    if name == "Emmett"
      puts "I can sing, too!"
    else
      puts "But I can't sing"
    end
  end
end

android = Android.new("Emmett","Boston")
android.singing_skills
