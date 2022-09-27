# frozen_string_literal: true

module OneApiSdk
  class Client
    module Movie
      # MOVIE METHODS
      # TODO: CHECK RETURN VALUES

      # List of all "The Lord of the Rings" movies, including the "The Lord of the Rings" and the "The Hobbit" movies.
      # @param options [Array<String>] The query parameters you want passed into the request, defaulting to an empty array.
      # @return [Array<Hash>] An array of movies
      def movies(options=[])
        response = call_with_token(Constants::MOVIE_BASE_PATH, options)
        JSON.parse(response.body)
      end

      # Request one specific movie
      # @param id [String] the unique id of the movie
      # @param options [Array<String>] The query parameters you want passed into the request.
      # @return [Hash] The returned movie object
      def movie(id,options=[])
        response = call_with_token("#{Constants::MOVIE_BASE_PATH}/#{id}", options)
        JSON.parse(response.body)
      end

      # Request all movie quotes for one specific movie (only working for the LotR trilogy)
      # @param id [String] the unique id of the movie
      # @param options [Array<String>] The query parameters you want passed into the request.
      # @return [Hash] The returned movie quotes object
      def movie_quotes(id,options=[])
        response = call_with_token("#{Constants::MOVIE_BASE_PATH}/#{id}/chapter", options)
        JSON.parse(response.body)
      end
    end
  end
end
