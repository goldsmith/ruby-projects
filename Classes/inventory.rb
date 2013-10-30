#!/usr/bin/ruby

# Create an application which manages an inventory of products. Create a product class which has a price, id, and quantity on hand. 
# Then create an *inventory* class which keeps track of various products and can sum up the inventory value.

class Product
	def initialize(price, id, quantity)
		# instance variables
		@price = price
		@id = id
		@quantity = quantity
	end

	def price 
		@price
	end

	def quantity
		@quantity
	end

	def to_s
		"#{@quantity} #{@id}s that cost $#{@price} each"
	end
end

class Inventory
	def initialize
		@items = []
	end

	def add(item)
		@items.push(item)
	end

	def value
		@items.map{ |x| x.price * x.quantity }.inject(:+)
	end
end

if __FILE__ == $0

	pencils = Product.new(1, "pencil", 20)
	staplers = Product.new(5, "stapler", 5)
	paper = Product.new(3.3, "paper", 100)

	inventory = Inventory.new
	
	[pencils, staplers, paper].each do |item|
		inventory.add item
		puts item
	end

	puts "total inventory value: $#{inventory.value}"

end