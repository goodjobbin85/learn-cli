 

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

	def print_detailed_stocks 
		puts ""
		puts "A list of all #{self.name.capitalize}'s stock!" 
		puts ""
		self.stocks.each do |stock| 

			puts "#{stock.ticker.upcase}" 
			puts "#{stock.company_name}" 
			#puts "Current Price: $#{stock.price(ticker)}"
			puts "52-week high: #{stock.week_52_high_dollar}"
			puts "52-week low: #{stock.week_52_low_dollar}"
			puts "Market Capitalization: #{stock.market_cap_dollar}"
			puts "Number of employees: #{stock.employees}" 
			puts "pe-ratio: #{stock.pe_ratio}"
			puts "200-day moving average: #{stock.day_200_moving_avg}"
			puts "50-day moving average: #{stock.day_50_moving_avg}" 
			puts "Outstanding shares: #{stock.shares_outstanding}" 
			puts "Next earnings date: #{stock.next_earnings_date}" 
			puts ""
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

