# frozen_string_literal: true

module OneApiSdk
  class Client
    module Books
      # BOOK METHODS
      # TODO: CHECK RETURN VALUES

      # List of all "The Lord of the Rings" books
      # @return [Array<Hash>] An array of books
      # @param query_params [String] the query parameters you want to include in your search
      #  IE: "?name=The Two Towers"
      def books(query_params="")
        response = call_with_token("#{Constants::BOOK_BASE_PATH}#{query_params}")
        JSON.parse(response.body)
      end

      # Request one specific book
      # @param id [String] the unique id of the book
      # @param query_params [String] the query parameters you want to include in your search
      #  IE: "?sort=name:asc"
      # @return [Hash] The returned book object
      def book(id,query_params="")
        response = call_with_token("#{Constants::BOOK_BASE_PATH}/#{id}#{query_params}")
        JSON.parse(response.body)
      end

      # Request one specific book
      # @param id [String] the unique id of the book
      # @param query_params [String] the query parameters you want to include in your search
      #  IE: "?sort=name:desc"
      # @return [Hash] The returned book object
      def book_chapters(id,query_params="")
        response = call_with_token("#{Constants::BOOK_BASE_PATH}/#{id}/chapter#{query_params}")
        JSON.parse(response.body)
      end
    end
  end
end
