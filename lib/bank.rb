class Account 
	attr_accessor :user, :balance 

	def initialize(user, balance=0) 
		@user = user 
		@balance =  balance
	end 
	
end