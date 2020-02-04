

require 'iex-ruby-client'

#StockQuote::Stock.new(api_key: Tpk_dd88c906f3ae4ac492644c2d0d82281d)



class Stock 
	attr_accessor :name, :ticker
	@@all = [] 

	def initialize(name, ticker) 
		@name = name 
		@ticker_symbol = ticker

		@@all << self 
	end

	def self.all_stocks 
		@@all_stocks 
	end
end 

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

puts stock.price("MSFT")
puts stock.price("IBM")
puts stock.price("F")
puts stock.price("ENPH") 

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


