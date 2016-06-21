class Ticket
  VENUES = ["Convention Center","Fairgrounds","Town Hall"]
  def initialize(venue,date)
    if VENUES.include?(venue)
      @venue = venue
    else
      raise ArgumentError, "Unknown venue #{venue}"
    end
    @date = date
  end
end

puts "We've closed the class definition."
puts "So we have to use the path notation to reach the constant."
puts "The venues are:"
puts Ticket::VENUES

venues = Ticket::VENUES
venues << "High School Gym" # << adds a value to the array
 
