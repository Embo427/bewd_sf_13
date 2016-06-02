require 'mechanize'
require 'pry'
require 'pry-byebug'
require 'csv'
require_relative 'apartment'

#investigate the HTML and determine patters
#develop gameplan
#5 steps that need to be written

#create an instance of mechanize
#mechanize will create an instance of everything on the page.
#this provides us with state, so that we can manipulate
def scrape_connect
  scraper = Mechanize.new
end

def search_results(form_values)
  results = form_values.submit
  results.search('p.row')
end

def scrape_it(url, query_name, min, max)
  # we are timing our hits with this method to avoid getting blocked
  scrape_connect.history_added = Proc.new {sleep 15.0}
  #this will be called every 15 seconds
  scrape_connect.get(url) do |search_page|
    #scanning the search_page object for form, with the id of searchform
    form_values = search_page.form_with(id: 'searchform') do |search|
      search['query'] = query_name
      search['min_price'] = min.to_i
      search['max_price'] = max.to_i
    end
    raw_results = search_results(form_values)
    parse_results(raw_results)
    binding.pry
  end
end

#iterate through listings, create instance of apartment, shovel it into results array
def parse_results(raw_results)
  results = []
  results << ['Name','URL','Price','Neighborhood']

  raw_results.each do |result|
    link = result.css('a')[1] #mechanize library
    name = link.text.strip
    url = "http://sfbay.craigslist.org" + link.attributes["href"].value
    price = result.search('span.price').text
    neighborhood = result.search('span.pnr').text[3..-13]

    puts "This apartment is located in #{neighborhood}"

    a = Apartment.new(name, neighborhood, price, url)
    results << [a.name, a.url, a.price, a.neighborhood]
    create_csv(results)
  end
end

def create_apartment(result)

end

def create_csv(results)
  #creates a new file with the title, and then w+ for write
  #you give it an array, and then iterate through and insert each row
  CSV.open("apartment_list.csv", "w+") do |csv_file|
    results.each do |row|
      csv_file << row
    end
  end
end


##Provide query_name, price range & url
url = 'https://boston.craigslist.org/search/aap'
query_name = 'Loft'
min = 1000
max = 5000

scrape_it(url,query_name,min,max)
