class TravelAgentSession
  def year=(y)
    @year = y.to_i
    if @year < 100
      @year = @year + 2000
    end
  end
end

date = "04/27/16"
month, day, year = date.split('/')
self.year = year

session = TravelAgentSession.new
session.year(year)
