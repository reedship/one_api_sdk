# frozen_string_literal: true

module OneApiSdk
  class Client
    module Movies
      # MOVIE METHODS
      # TODO: CHECK RETURN VALUES

      # List of all "The Lord of the Rings" movies, including the "The Lord of the Rings" and the "The Hobbit" movies.
      # @param query_params [String] the query parameters you want to include in your search
      #  IE: "?sort=name:asc"
      # @return [Array<Hash>] An array of movies
      def movies(query_params="")
        response = call_with_token("#{Constants::MOVIE_BASE_PATH}#{query_params}")
        JSON.parse(response.body)
      end

      # Request one specific movie
      # @param id [String] the unique id of the movie
      # @param query_params [String] the query parameters you want to include in your search
      #  IE: "?sort=name:asc"
      # @return [Hash] The returned movie object
      def movie(id,query_params="")
        response = call_with_token("#{Constants::MOVIE_BASE_PATH}/#{id}#{query_params}")
        JSON.parse(response.body)
      end

      # Request all movie quotes for one specific movie (only working for the LotR trilogy)
      # @param id [String] the unique id of the movie
      # @param query_params [String] the query parameters you want to include in your search
      #  IE: "?limit=50"
      # @return [Hash] The returned movie quotes object
      def movie_quotes(id,query_params="")
        response = call_with_token("#{Constants::MOVIE_BASE_PATH}/#{id}/quote#{query_params}")
        JSON.parse(response.body)
      end
    end
  end
end
