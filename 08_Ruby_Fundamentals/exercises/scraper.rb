require 'pry'
require 'pry-byebug'
require 'mechanize'
require 'csv'
require_relative 'apartment'

#Goal:
   #1) Find apartment listings section of craigslist using the 'mechanize' gem
       #a Use the existing form's 'query', 'min_price' and 'max_price' to trigger queries.
       #b Return the title, url, price and location for each listing
   #2)  Save the results to a CSV file using Ruby's 'csv' library
   #3) Use OOP, DRY and 'Brick By Brick' principles to build your script
       #Using the apartment.rb file to create an instance of each

def scrape(url)
  scraper = Mechanize.new
  scraper.history_added = Proc.new { sleep 1.0 }
  scraper.get(url) do |page| # pulls everything on the page, and set each thing as it's own instance
    form = page.form_with(id: 'searchform') do |s| #finding all data within searchform part of view layer
      #assigning new values to query, min_price and max_price
      s['query'] = "loft"
      s['min_price'] = 1000
      s['max_price'] = 6000
    end
      data = form.submit #submitting search request with above values & returning results
      data_results(data) #executing data_results method on data
  end
end

def data_results(data)
  results = data.search('p.row') #zeroing in on the specific HTML pattern to return
  results.each do |listing|
    create_apartment(listing)
  end
end

def create_apartment(listing)
  price = listing.search('span.price').text.strip
  neighborhood = listing.search('span.pnr').text.strip #fix this
  name = listing.search('span.pl').text.strip #needs to be fixed
  url = listing.css('a')[1].attributes["href"].values #just the endpoint, need to concatenate it with the beginning

  apts = {}
  apt = Apartment.new(price, neighborhood, name, url)
  apt_details = {price: price, neighborhood: neighborhood, name: name, url: url}
  binding.pry
  apts['#{apt}'] = apt_details
  create_csv(apts)
end

def create_csv(apts)
  binding.pry
  csv = CSV.open('apartments.csv','wb') do |csv|
    csv << apts[0]
  end
end


url = 'http://sfbay.craiglist.org/search/sfc/apa'
scrape(url)



#return a URL, return the name of the URL (inspect), return the price, return the location
#include a method in the script that will take advantage of max price, min price, query box values
#need to be able to input whatever values you want

#need an instance of apartment with state. using that instance to create a line in the CSV file
#read the mechanize documentation
