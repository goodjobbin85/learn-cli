

require 'iex-ruby-client'

#StockQuote::Stock.new(api_key: Tpk_dd88c906f3ae4ac492644c2d0d82281d)



class Stock 
	attr_accessor :name, :ticker, :user

	@@all_stocks = [] 

	def initialize(name, ticker) 
		@name = name 
		@ticker_symbol = ticker

		@@all_stocks << self 
	end

	def self.all_stocks 
		@@all_stocks 
	end 

	def self.stock_price(ticker) 
		stock = IEX::Api::Client.new(
			publishable_token: 'Tpk_dd88c906f3ae4ac492644c2d0d82281d',
			endpoint: 'https://sandbox.iexapis.com/v1'
			)  
		quote = stock.quote(ticker.upcase) 
		puts quote.latest_price 
	end 

	def self.week_52_high(ticker) 
		stock = IEX::Api::Client.new(
			publishable_token: 'Tpk_dd88c906f3ae4ac492644c2d0d82281d',
			endpoint: 'https://sandbox.iexapis.com/v1'
			)  
			key_stats = stock.key_stats(ticker) 
			puts "52-week high: #{key_stats.week_52_high}"
	end 

	def self.week_52_low(ticker) 
		stock = IEX::Api::Client.new(
			publishable_token: 'Tpk_dd88c906f3ae4ac492644c2d0d82281d',
			endpoint: 'https://sandbox.iexapis.com/v1'
			)  
			key_stats = stock.key_stats(ticker) 
			puts "52-week low: #{key_stats.week_52_low}"
	end 

	def self.print_detailed_stats(ticker) 
		stock = IEX::Api::Client.new(
			publishable_token: 'Tpk_dd88c906f3ae4ac492644c2d0d82281d',
			endpoint: 'https://sandbox.iexapis.com/v1'
			)  
		key_stats = stock.key_stats(ticker) 
		puts "#{key_stats.company_name}"
		puts "52-week high: #{key_stats.week_52_high_dollar}"
		puts "52-week low: #{key_stats.week_52_low_dollar}"
		puts "Market Capitalization: #{key_stats.market_cap_dollar}"
		puts "Number of employees: #{key_stats.employees}" 
		puts "pe-ratio: #{key_stats.pe_ratio}"
		puts "200-day moving average: #{key_stats.day_200_moving_avg}"
		puts "50-day moving average: #{key_stats.day_50_moving_avg}" 
		puts "Outstanding shares: #{key_stats.shares_outstanding}" 
		puts "Next earnings date: #{key_stats.next_earnings_date}"
	end

end 
=begin
stock = IEX::Api::Client.new(
	publishable_token: 'Tpk_dd88c906f3ae4ac492644c2d0d82281d',
	endpoint: 'https://sandbox.iexapis.com/v1'
	)
company = stock.company('MSFT')

puts company.ceo # 'Satya Nadella'
puts company.company_name
key_stats = stock.key_stats("MSFT") 

puts "the number of employees at #{company.company_name} is #{key_stats.employees}"
puts "the 52 week dollar change is #{key_stats.week_52_change_dollar}"
puts "the 52 week high at #{company.company_name} is #{key_stats.week_52_high}"

puts "#{company.company_name}: #{stock.price("MSFT")}"
puts "#{stock.company("IBM").company_name}: #{stock.price("IBM")}"
puts stock.price("F")
puts stock.price("ENPH") 
puts stock.price("TSLA")
=end 

=begin
ohlc = stock.ohlc.get('ENPH') 
puts ohlc.close.price # 90.165
puts ohlc.close.time #
puts ohlc.open.price # 0.375
puts ohlc.open.time
puts ohlc.high # 0.00418
puts ohlc.low
=end
#stock = Stock.new("Microsoft", "MSFT") 
#stock = Stock.new("Tesla", "TSLA") 
#puts stock.name 

puts Stock.stock_price("MSFT")


