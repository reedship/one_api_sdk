# frozen_string_literal: true

module OneApiSdk
  class Client
    module Quotes
      # QUOTE METHODS
      # TODO: CHECK RETURN VALUES

      # List all movie quotes
      # @param query_params [String] the query parameters you want to include in your search
      #  IE: "?sort=name:asc"
      # @return [Array<Hash>] An array of quotes
      def quotes(query_params="")
        response = call_with_token("#{Constants::QUOTE_BASE_PATH}#{query_params}")
        JSON.parse(response.body)
      end

      # Request one specific movie quote
      # @param id [String] the unique id of the quote
      # @param query_params [String] the query parameters you want to include in your search
      #  IE: "?sort=name:asc"
      # @return [Hash] The returned quote object
      def quote(id,query_params="")
        response = call_with_token("#{Constants::QUOTE_BASE_PATH}/#{id}#{query_params}")
        JSON.parse(response.body)
      end
    end
  end
end
