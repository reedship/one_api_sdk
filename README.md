# OneApiSdk

This SDK allows for you to access The One API, an API for The Lord of the Rings, from within your ruby code. You can find the rubydoc documentation HERE. TODO: PUT DOC LINK

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'one_api_sdk'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install one_api_sdk

## Usage
To instantiate the SDK, pass the Access Token retrieved from https://the-one-api.dev/account in the constructor method of the client. All methods take an optional `query_params` parameter as the final argument. The API (from my testing) only allows one query parameter at a time to be processed.

``` ruby
	require 'one_api_sdk'
	client = OneApiSdk::Client.new("YOUR ACCESS TOKEN HERE")

	# without query parameter
	result = client.books()
	# example query parameter
	limited_result = client.books('?limit=2')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/reedship/one_api_sdk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/reedship/one_api_sdk/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OneApiSdk project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/reedship/one_api_sdk/blob/master/CODE_OF_CONDUCT.md).
