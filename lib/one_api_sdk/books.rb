# frozen_string_literal: true

module OneApiSdk
  class Client
    module Books
      # BOOK METHODS
      # TODO: CHECK RETURN VALUES

      # List of all "The Lord of the Rings" books
      # @param options [Array<String>] The query parameters you want passed into the request, defaulting to an empty array.
      # @return [Array<Hash>] An array of books

      def books(options=[])
        response = call_with_token(Constants::BOOK_BASE_PATH)
        JSON.parse(response.body)
      end

      # Request one specific book
      # @param id [String] the unique id of the book
      # @param options [Array<String>] The query parameters you want passed into the request.
      # @return [Hash] The returned book object
      def book(id,options=[])
        response = call_with_token("#{Constants::BOOK_BASE_PATH}/#{id}", options)
        JSON.parse(response.body)
      end

      # Request one specific book
      # @param id [String] the unique id of the book
      # @param options [Array<String>] The query parameters you want passed into the request.
      # @return [Hash] The returned book object
      def book_chapters(id,options=[])
        response = call_with_token("#{Constants::BOOK_BASE_PATH}/#{id}/chapter", options)
        JSON.parse(response.body)
      end
    end
  end
end
