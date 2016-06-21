ticket = Object.new

def ticket.date
  "01/02/03"
end
def ticket.venue
  "Town Hall"
end
def ticket.event
  "Author's reading"
end
def ticket.performer
  "Mark Twain"
end
def ticket.seat
  "Second Balcony, row J, seat 12"
end
def ticket.price
  5.50
end

# puts "This ticket is for: #{ticket.event}, at #{ticket.venue}." +
#   "The performer is #{ticket.performer}." +
#   "The seat is #{ticket.seat}, " +
#   "and it coses $#{"%.2f." % ticket.price}"
#
# def ticket.availability_status
#   "sold"
# end

def ticket.available?
  false
end

# if ticket.available?
#   puts "You're in luck!"
# else
#   puts "Sorry--that seat has been sold."
# end

print "Information desired: "
request = gets.chomp

# if request == "venue"
#   puts ticket.venue
# elsif request == "performer"
#   puts ticket.performer
# end

if ticket.respond_to?(request)
  puts ticket.send(request)
else
  puts "No such information available"
end
