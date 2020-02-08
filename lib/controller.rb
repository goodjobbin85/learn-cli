class Controller 

	def initialize
		
	end
	def invest 

		stock = IEX::Api::Client.new(
			publishable_token: 'Tpk_dd88c906f3ae4ac492644c2d0d82281d',
			endpoint: 'https://sandbox.iexapis.com/v1'
			) 

		puts "Let's make some money!" 
		puts "Select a number to start."
		puts "1. Research stock prices." 
		puts "2. Add stock to portfolio." 
		puts "3. Review your bank account." 
		puts "4. Add funds to your account."
		puts "5. Schedule a stock purchase." 
		puts "6. View your portfolio." 
		puts "7. Create a new portfolio." 
		puts "8. Run a portfolio analysis." 
		puts "9. Detailed stock information."
		response = nil 
		
		case response 
		when "1" 
			puts "Please enter a stock ticker:" 
			ticker = gets.chomp 
			puts Stock.stock_price(ticker.upcase)
		when "2" 
			puts "2" 
		when "3"
			puts "3" 
		when "4" 
			puts "4" 
		when "5" 
			puts "5" 
		when "6" 
			puts "6" 
		when "7" 
			puts "7" 
		when "8" 
			puts "8" 
		else 
			puts "exiting..." 
		end

		while response != "exit"
			puts "Please enter the ticker symbol of the stock you want"
			ticker = gets.chomp 
			Stock.create(ticker)
	#		quote = stock.quote(ticker.upcase) 
	#		puts quote.latest_price 
			Stock.stock_price(ticker) 
			key_stats = stock.key_stats(ticker) 
			Stock.week_52_high(ticker)
			Stock.week_52_low(ticker) 
			Stock.print_detailed_stats(ticker)
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