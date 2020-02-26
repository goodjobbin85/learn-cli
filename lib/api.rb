class Api 
	def initialize 
	end 

	def set_api_client 
		stock = IEX::Api::Client.new(
			publishable_token: 'Tpk_dd88c906f3ae4ac492644c2d0d82281d',
			endpoint: 'https://sandbox.iexapis.com/v1'
			) 
	end 
end 