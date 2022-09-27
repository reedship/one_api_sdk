# frozen_string_literal: true

require 'http'
require 'json'
require 'erb'
require 'uri'

require 'one_api_sdk/books'
require 'one_api_sdk/chapters'
require 'one_api_sdk/characters'
require 'one_api_sdk/constants'
require 'one_api_sdk/movies'
require 'one_api_sdk/quotes'



module OneApiSdk
  class Client
    include Books
    include Chapters
    include Characters
    include Constants
    include Movies
    include Quotes

    attr_accessor :access_token
    attr_accessor :base_api_url

    # Initialize using passed in access token
    # @param access_token [String] The access token for The One Api
    # @see https://the-one-api.dev/account
    def initialize(access_token='')
      @access_token = access_token
      @base_api_url = Constants::API_BASE_PATH
      @http ||= HTTP::Client.new
    end

    # This method calls each method and attaches the access token under the authorization header
    # @param path [String] the path to the endpoint including any query parameters
    # @see https://the-one-api.dev/documentation#4 Available Query Parameters
    #  IE: '/books?offset=1'
    def call_with_token(path)
      @http
        .headers(accept: 'application/json', content: 'application/json')
        .auth("Bearer #{@access_token}")
        .send('get', URI(@base_api_url + path))
    end
  end
end
