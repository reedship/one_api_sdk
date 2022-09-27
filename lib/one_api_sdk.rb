require "one_api_sdk/version"
require "one_api_sdk/client"

module OneApiSdk
  class Error < StandardError; end
  # Your code goes here...
  def self.new(*args)
    OneApiSdk::Client.new(*args)
  end
end
