class User
	attr_accessor :name 

	@@all = [] 

	def initialize(name) 
		@name = name 
		welcome_message
		@stocks = []
	end 

	def self.all 
		@@all 
	end 

	def welcome_message 
		puts "Welcome #{self.name}! Let's start trading!" 
	end 
end 

tom = User.new("Tom")