class Controller 

	def initialize
		
	end
	def invest 

		stock = IEX::Api::Client.new(
			publishable_token: 'Tpk_dd88c906f3ae4ac492644c2d0d82281d',
			endpoint: 'https://sandbox.iexapis.com/v1'
			) 
		
		puts "Let's add stocks to your portfolio!" 
		puts "But first, some information about yourself." 
		puts "What is your name?" 
		investor_name = gets.chomp 
		user = User.new(investor_name)

		response = nil 
		while response != 'exit'
			puts "1. Research stock prices." 
			puts "2. Add stock to portfolio." 
			puts "3. Advanced stock details."
			puts "3. Review your bank account." 
			puts "4. Add funds to your account."
			puts "6. View your portfolio." 
			puts "7. Press 'exit' to complete setup."
			print "Please select a number:"
			response = gets.chomp 

			case response 

			when "1" 
				puts "Please enter a stock ticker:" 
				ticker = gets.chomp 
				puts Stock.stock_price(ticker.upcase)
			when "2" 
				puts "Hi #{investor_name.capitalize}. We've created an account for you!" 
				puts "Now lets find some stocks to add to your portfolio." 
				print "Please enter a stock ticker:" 
				ticker = gets.chomp 
				puts Stock.stock_price(ticker.upcase) 
				new_stock = Stock.create(ticker) 
				user.add_stock(new_stock) 
				user.print_stocks 
				puts "Would you like to add more stocks?(y/n)" 
				response = gets.chomp	

					while response == "yes" || response == "y"

						print "Please enter a stock ticker:" 
						ticker = gets.chomp 
						puts Stock.stock_price(ticker.upcase) 
						new_stock = Stock.create(ticker) 
						user.add_stock(new_stock) 
						user.print_stocks 
						puts "Would you like to add more stocks?(y/n)" 
						response = gets.chomp  
					end 
					puts ""
					puts ""
				 	puts "Thanks for investing in your future with us!" 
				 	puts "Here are the companies you are now investing in:" 
				 	puts "" 
				 	user.print_stocks
				
			when "3"
				puts "Please enter a stock ticker:" 
				ticker = gets.chomp 
				puts Stock.print_detailed_stats(ticker)
			when "4" 
				puts "4" 
			when "5" 
				puts "5" 
			when "6" 
				puts "Your Portfolio"
				user.print_stocks 
			when "exit" 
				break
			else 
				puts "Thanks and good luck!" 
				break
			end 

		end 
	end

=begin
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
=end

		


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