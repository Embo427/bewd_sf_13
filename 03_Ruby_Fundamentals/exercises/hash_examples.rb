cars = {}
cars[:tesla] = {year: 2016, model: "Model x", price: "80000"}
cars[:ford] = {year: 1967, model: "Mustang", price: "30000"}

#length
puts "The length hash method returns the length of the hash"
puts cars.length

#merge
puts "The merge hash method combines two hashes into one, replacing duplicate values with the value of the 2nd duplicate key"
h1 = {"a"=>100, "b"=>200}
h2 = {"b"=>300, "c"=>400}
h3 = h1.merge(h2)
puts h3
puts h1

#select
puts "The select hash method is an iterator that cycles through key/value pairs, and takes action based on some condition"
h4 = h1.select {|k,v| k > "a"}
puts h4
h5 = h3.select {|k,v| v < 400}
puts h5

#keys, values
puts "The keys and values methods return all the keys and all the values of a hash"
puts cars.keys
# puts cars[:tesla].keys
# puts cars[:tesla].values
puts cars[:tesla].values_at("year","model")

#has_key?
puts cars.has_key?("tesla")
