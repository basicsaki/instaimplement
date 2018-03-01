module Instaimplement
	class Endpoints

	  attr_accessor :access_token
	  
		def initialize(access_token)
			@access_token = access_token
		end

		def recent_media(count)			
			response = HTTParty.get("https://api.instagram.com/v1/users/self/media/recent/?access_token=#{self.access_token}&count=#{count}")
			formatted_data = convert_to_mash(response["data"])
			return {:data=>formatted_data,:next_url=>response["pagination"]["next_url"]}
		end

		def information
			 response = HTTParty.get("https://api.instagram.com/v1/users/self/?access_token=#{self.access_token}")
			 formatted_data = convert_to_mash(response["data"])
			 return formatted_data
		end

		protected

		def convert_to_mash data
			if data.is_a? Hash
			Hashie::Mash.new(data)
			elsif data.is_a? Array
			data.map { |d| Hashie::Mash.new(d) }
			end
		end

	end
end