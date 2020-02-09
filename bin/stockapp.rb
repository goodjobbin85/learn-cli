#!/usr/bin/env ruby 


require_relative '../config/environment' 
require_relative '../config/iex-client.rb'

#Controller.new.invest 

=begin
user = User.new("Tom") 
puts "Your stocks: #{user.stocks}" 
=end 

paul = User.new("Paul") 
natty = User.new("Natty") 

tsla = Stock.create("TSLA") 
msft = Stock.create("MSFT") 
enph = Stock.create("ENPH")
ford = Stock.create("F") 
goog = Stock.create("GOOG") 

Stock.all.each do |stock| 
	puts stock.ticker 
end 

paul.add_stock(tsla) 
paul.add_stock(ford) 
paul.add_stock(goog) 

puts "puts all user's stocks below" 
paul.stocks.each do |stock| 
	puts stock.ticker 
end 

puts "puts all stocks users below"
paul.stocks.each do |stock| 
	puts stock.user.name
end



