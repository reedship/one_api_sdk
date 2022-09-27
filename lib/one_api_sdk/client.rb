# frozen_string_literal: true

require 'http'
require 'json'
require 'erb'

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

    # Initialize using passed in access token
    # @param
    def initialize(access_token)
      @access_token = access_token || ENV['access_token']
      @base_api_url = Constants::API_BASE_PATH
      @http ||= HTTP::Client.new
    end

    # This method calls each method and attaches the access token under the authorization header
    # @param path [String] the path to the endpoint
    # @param options [Array] the request query paramaters, set to an empty array by default. All params will be concatenated onto the end of the path.
    # @see https://the-one-api.dev/documentation#4 Available Query Parameters
    #  IE: ['name=Gandalf', 'limit=100']
    def call_with_token(path,options=[])
      uri = create_uri(path,options)
      @http
        .headers(accept: 'application/json', content: 'application/json')
        .auth("Bearer #{@access_token}")
        .send('get', uri)
    end

    # Create the uri path, passing in the query paramaters.
    # @param path [String] the path to the endpoint
    # @param options [Array] the request query paramaters, set to an empty array by default. All params will be concatenated onto the end of the path.
    def create_uri(path, options)
      uri = @base_api_url
      if options.empty?
        uri += path
      else
        uri += path + options.map { |param| param.insert(0,'?') }
      end
      uri
    end

  end
end
