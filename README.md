# Instaimplement

This gem is based on API endpoints as mentioned in https://www.instagram.com/developer/
Based on oauth2 the gem first authenticates the authorization server,gets an access token then resources from the resource server are requested.

Limitation: The gem only can hit at endpoints with basic scope as other scopes in instagram need a permission.  
	## Installation

			Add this line to your application's Gemfile:

				$ gem 'instaimplement', :git => 'https://github.com/basicsaki/instaimplement.git'

			And then execute:

			    $ bundle

			## Usage

			To install the files related with the gem 

				$ rails g instaimplement:models
				$ rake db:migrate

			To initiate a new access token

			    client = Instaimplement::Connect.new(ENV[:client_id],ENV[:client_token],ENV[:callback_url])
			    redirect_to client.authorization_url

			This will give you the code with which an access token can be generated
			The code can be accessed at callback url

				access_token = client.get_access_token( params[:code] )
            To save the user details in the model InstagramUser
				client.set_or_update_user_details(response)



			#Requests

			For endpoints with basic scope
			Here count is the number of images that is requested from instagram side and next url is the pagination link.

				request:  images = client.recent_media(count)
				response: {data: images,next_url: "pagination_url" }


			To get logged in user information

				client.information

			#Demo:
			The demo for integration using this gem can be found at:
			https://instagramsample.herokuapp.com/


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/basicsaki/instaimplement.

## Demo
The demo for integration using this gem can be found at https://instagramsample.herokuapp.com/


##Future Scope

##RoadMap

			Since new instagram API is graph.
			Complete integration of new APIs from instagram coming soon.
		

##Instagram Graph API

			As per their documentation we will need a business account to get this integration up and running.

			"An API for accessing data in large- and medium-sized Instagram Business Accounts.

			The Instagram Graph API allows you to programmatically access Instagram Business Accounts so you can more easily manage media objects, view comments and metadata, and get insights and metrics with custom built apps.

			If you are building apps for Instagram Non-Business Accounts, please use the Instagram Platform API instead"

			Graph API and business links for instagram

			https://developers.facebook.com/docs/instagram-api/overviews

			https://business.instagram.com/getting-started?locale=en_GB

			https://www.outboundengine.com/blog/how-to-set-up-an-instagram-business-account/

			https://www.facebook.com/business/help/502981923235522
		



## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
