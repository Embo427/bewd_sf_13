class Apartment
  attr_accessor :name, :neighborhood, :price, :url
  def initialize(name,neighborhood,price,url)
    @name = name
    @neighborhood = neighborhood
    @price = price
    @url = url
  end
  end
