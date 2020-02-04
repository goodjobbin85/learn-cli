 

class User
	attr_accessor :name, :stocks

	@@all = [] 

	def initialize(name, stocks=nil) 
		@name = name 
		welcome_message
		@stocks = stocks
	end 

	def self.all 
		@@all 
	end 

	def welcome_message 
		puts "Welcome #{self.name}! Let's start trading!" 
	end 

	def stocks 
		if @stocks 
			@stocks 
		else 
			print "No stocks acquired yet!" 
		end 
	end 

	def add_stock(stock)
		#add stock to @stocks unless it already includes stock 
		stock.user == self 
		@stocks << stock unless @stocks.include?(stock)
	end 

end 
#(tsla) 
#tom.add_stock("TSLA")
#puts "all your stocks: #{tom.stocks}" 

