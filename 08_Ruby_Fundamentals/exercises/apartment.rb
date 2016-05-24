require 'pry'
require 'pry-byebug'

#create an apartment class using OOP principles
class Apartment
  attr_accessor :price, :neighborhood, :name, :url

  def initialize(price, neighborhood, name, listing)
    @price = price
    @neighborhood = neighborhood
    @name = name
    @url = url
  end
end
