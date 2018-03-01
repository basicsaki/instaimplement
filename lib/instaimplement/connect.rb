module Instaimplement
	class Connect

		attr_accessor :client_id,:client_secret,:callback_url

		def initialize(client_id,client_secret,callback_url)
			@client_id = client_id
			@client_secret = client_secret 
			@callback_url = callback_url
		end

		def authorization_url
			"https://api.instagram.com/oauth/authorize/?client_id=#{self.client_id}&redirect_uri=#{self.callback_url}&response_type=code"
		end

		def set_or_update_user_details(response)
			insta_user = InstagramUser.find_by( insta_id: response["user"]["id"] ) 
			if insta_user == []
				InstagramUser.create(insta_id: response["user"]["id"],username: response["user"]["username"],profile_picture_link: response["user"]["profile_picture"],full_name: response["user"]["full_name"],bio: response["user"]["bio"],website: response["user"]["website"],access_token: response["access_token"])
			else
				insta_user = InstagramUser.new(insta_id: response["user"]["id"],username: response["user"]["username"],profile_picture_link: response["user"]["profile_picture"],full_name: response["user"]["full_name"],bio: response["user"]["bio"],website: response["user"]["website"],access_token: response["access_token"])
				insta_user.changed?
				InstagramUser.update(insta_id: response["user"]["id"],username: response["user"]["username"],profile_picture_link: response["user"]["profile_picture"],full_name: response["user"]["full_name"],bio: response["user"]["bio"],website: response["user"]["website"],access_token: response["access_token"])
			end
		end

		def get_access_token(code)
			response = HTTParty.post("https://api.instagram.com/oauth/access_token",:body=>{ "client_id" => "#{self.client_id}","client_secret"=> "#{self.client_secret}", "grant_type"=>"authorization_code" ,"redirect_uri"=>"#{self.callback_url}","code"=>code})
			return response
		end

	end
end