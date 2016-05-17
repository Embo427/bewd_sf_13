require 'pry'
require 'pry-byebug'

class Thermostat

  #creates getter && setter methods for each attribute
  attr_accessor :current_temp
  attr_reader :target

#instance_factory to support creating a new thermostat using Thermostat.new
  def initialize(current_temp, target)
    @current_temp = current_temp
    @target = target
  end

 #self.target , @target and target are all the same inside of this instance method
  def calibrate_temp
    #use a conditional to calibrate the temperature
    self.current_temp = target
  end

  def self.detect_temperature(all_temps, target_temp)
    #loop through all temps, detect the temperature, then calibrate it
    all_temps.each do |temp|
      thermostat = Thermostat.new(temp, target_temp) #put the if statement above in the instance method calibrate_temp
        if temp != target_temp
          binding.pry
          puts "Calibrating temperature..."
          thermostat.calibrate_temp
        else
          "The temperature is perfect."
        end
    end
  end
end

#The temperature is being read externally somewhere, so let's just create an array of those readings
#and pass them into our class method Thermostat.detect_temperature(all_temps, target_temp)

#array_to_temperatures
all_temps = [75, 45,65,85,95, 66, 99, 75, 12, 22, 45, 65, 75, 70, 100, 10, 52, 22]
#set by user
target_temp = 75

Thermostat.detect_temperature(all_temps, target_temp)
