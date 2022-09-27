# frozen_string_literal: true

module OneApiSdk
  class Client
    module Quote
      # QUOTE METHODS
      # TODO: CHECK RETURN VALUES

      # List all movie quotes
      # @param options [Array<String>] The query parameters you want passed into the request, defaulting to an empty array.
      # @return [Array<Hash>] An array of quotes
      def quotes(options=[])
        response = call_with_token(Constants::QUOTE_BASE_PATH, options)
        JSON.parse(response.body)
      end

      # Request one specific movie quote
      # @param id [String] the unique id of the quote
      # @param options [Array<String>] The query parameters you want passed into the request.
      # @return [Hash] The returned quote object
      def quote(id,options=[])
        response = call_with_token("#{Constants::QUOTE_BASE_PATH}/#{id}", options)
        JSON.parse(response.body)
      end
    end
  end
end
