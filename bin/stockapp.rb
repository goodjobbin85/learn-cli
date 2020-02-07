#!/usr/bin/env ruby 


require_relative '../config/environment' 
require_relative '../config/iex-client.rb'

Controller.new.invest 

=begin
user = User.new("Tom") 
puts "Your stocks: #{user.stocks}" 
=end


