



#StockQuote::Stock.new(api_key: Tpk_dd88c906f3ae4ac492644c2d0d82281d)



class Stock 
	attr_accessor :ticker, :user, :week_52_high_dollar, :week_52_low_dollar, :company_name, :market_cap_dollar,
				:employees, :pe_ratio, :day_200_moving_avg, :day_50_moving_avg, :shares_outstanding, 
				:next_earnings_date  


	@@all = [] 

	def initialize(ticker, user=nil) 
		@ticker = ticker
		@user = user
		@company_name = company_name
		@week_52_high_dollar = week_52_high_dollar
		@week_52_low_dollar = week_52_low_dollar 
		@market_cap_dollar = market_cap_dollar 
		@employees = employees 
		@pe_ratio = pe_ratio
		@day_200_moving_avg = day_200_moving_avg 
		@day_50_moving_avg = day_50_moving_avg 
		@shares_outstanding = shares_outstanding 
		@next_earnings_date = next_earnings_date 

	#	self.save if !Stock.all.include?(self)
	end 

=begin
	def initialize(hash) 
		hash.each do |key, value| 
			self.send(("#{key=}"), value) 
		end 
	end 
=end

	def self.create(ticker) 
		stock = IEX::Api::Client.new(
			publishable_token: 'Tpk_dd88c906f3ae4ac492644c2d0d82281d',
			endpoint: 'https://sandbox.iexapis.com/v1'
			)  
		key_stats = stock.key_stats(ticker) 

		new_stock = Stock.new(ticker) 
		new_stock.company_name = key_stats.company_name
		new_stock.week_52_high_dollar = key_stats.week_52_high_dollar 
		new_stock.week_52_low_dollar = key_stats.week_52_low 
		new_stock.market_cap_dollar = key_stats.market_cap_dollar 
		new_stock.employees = key_stats.employees 
		new_stock.pe_ratio = key_stats.pe_ratio 
		new_stock.day_200_moving_avg = key_stats.day_200_moving_avg 
		new_stock.day_50_moving_avg = key_stats.day_50_moving_avg 
		new_stock.shares_outstanding = key_stats.shares_outstanding 
		new_stock.next_earnings_date = key_stats.next_earnings_date 
#		new_stock.save if !self.all.include?(self) 
		new_stock
	end 

	def save 
		@@all << self
	end 
=begin
	def initialize(attributes) 
		attributes.each { |key, value| self.send("#{key}=", value)} 
	end 

	def name
		@name
	end 
=end
	def self.all
		@@all
	end 

	def self.stock_price(ticker) 
		stock = IEX::Api::Client.new(
			publishable_token: 'Tpk_dd88c906f3ae4ac492644c2d0d82281d',
			endpoint: 'https://sandbox.iexapis.com/v1'
			)  
		company = stock.company(ticker)
		quote = stock.quote(ticker.upcase) 
		puts "#{company.company_name}: #{quote.latest_price}"
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
		puts "Current Price: $#{stock.price(ticker)}"
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




