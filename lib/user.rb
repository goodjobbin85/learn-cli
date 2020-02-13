 

class User
	attr_accessor :name, :stocks

	@@all = [] 

	def initialize(name, stocks=[]) 
		@name = name 
		welcome_message


		@stocks = stocks
	end 

	def self.all 
		@@all 
	end 

	def welcome_message 
		puts "Welcome #{self.name.capitalize}! Let's start investing!" 
	end 

	def stocks 
		#@stocks.dup.freeze
		if !@stocks.nil? 
			@stocks 
		else 
			print "No stocks acquired yet!" 
		end 
	end 

	def print_stocks 
		puts "A list of all #{self.name.capitalize}'s stock!"
		self.stocks.each do |stock| 
			puts "#{stock.ticker.upcase}"
		end 
		puts ""
		puts ""
	end 

	def add_stock(stock)
		#add stock to @stocks unless it already includes stock 
		stock.user = self 
		@stocks << stock 
	end 

end 
#(tsla) 
#tom.add_stock("TSLA")
#puts "all your stocks: #{tom.stocks}" 

