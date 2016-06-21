class Ticket
  attr_reader :venue, :date, :price
  # def venue
  #   @venue
  # end
  # def date
  #   @date
  # end
  attr_accessor :price #both reads and writes
  # def price
  #   @price
  # end
  # def price=(price)
  #   @price = price
  # end
  #alternatively, can just do but this only allows one at a time:
  # attr :price, true
  def initialize(venue,date)
    @venue = venue
    @date = date
  end
  def Ticket.most_expensive(*tickets)
    tickets.max_by(&:price)
  end
end

th = Ticket.new("Town Hall","11/12/13")
cc = Ticket.new("Convention Center","12/13/14")
fg = Ticket.new("Fairgrounds","13/14/15")
th.price = 12.55
cc.price = 10.00
fg.price = 18.00
highest = Ticket.most_expensive(th,cc,fg)
# puts "The highest-priced ticket is the one fore #{highest.venue}"
puts "Testing the response of a ticket instance..."
wrong = fg.most_expensive
