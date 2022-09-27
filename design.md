# Design Doc

## Basic Principles

When making this sdk I wanted to follow a couple key points.
  * Top Level Access to all methods

	I didn't want to have the user dig through multiple imported modules or classes to get access to methods. Everything is available from the base `OneApiSdk::Client` class.
  * Simple configuration

	The API uses only a `Access Token` and the SDK should be just as simple.
	```ruby
		client = OneApiSdk::Client.new("YOUR ACCESS TOKEN HERE")
	```
  * Self documenting code.

	I wanted documentation to be easily accessible and automatically updating. So i chose to use rubydoc for documentation generation.

## Structure

Modules in the project are seperated by their corresponding endpoint, and included into the base `Client` class. There is no configuration for the sdk, due to the time limit, and all requests return the response body by default.
```
	# project root
	...
	one_api_sdk.gemspec
	README.md
	design.md << you are here
	lib/
		one_api_sdk.rb
		one_api_sdk/
			books.rb
			chapters.rb
			characters.rb
			client.rb << main entry point
			constants.rb
			movies.rb
			quotes.rb
			version.rb
	...
```

## Testing

All testing is done using VCR cassettes (due to the limited available requests per hour). Repeated HTTP calls use cached responses in individual `YAML` files. I chose this due to the 'one and done' style of this project, in a production environment I would set expiration dates on the cassettes so that cached responses weren't stored for too long where there would be worry surrounding whether or not the cassettes were truly accurate to the current version of the API.

To run all tests call `rake spec`||`rspec spec/one_api_sdk_spec.rb` and individual sections/tests can be run by running `rspec spec/one_api_sdk_spec.rb:<LINE_NUMBER>`.
