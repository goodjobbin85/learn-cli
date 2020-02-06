class Controller 

	def initialize
		
	end
	def invest 

		stock = IEX::Api::Client.new(
			publishable_token: 'Tpk_dd88c906f3ae4ac492644c2d0d82281d',
			endpoint: 'https://sandbox.iexapis.com/v1'
			) 

		puts "Let's make some money!" 
		puts "If you would like to search for stocks, type in the ticker symbol."
		response = nil 
		

		while response != "exit"
			puts "Please enter the ticker symbol of the stock you want"
			ticker = gets.chomp 
	#		quote = stock.quote(ticker.upcase) 
	#		puts quote.latest_price 
			Stock.stock_price(ticker)
			puts "would you like to exit?"  
			response = gets.chomp
		end
	end 


		


=begin
		user = User.new("Tom") 
		stock = Stock.new("Tesla", "TSLA") 
		puts user.stocks 
		user.add_stock(stock) 
		puts "Your stocks are #{user.stocks}"
		puts stock.name 
		puts Stock.all_stocks 


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
end