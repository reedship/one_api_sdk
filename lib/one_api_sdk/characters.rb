# frozen_string_literal: true

module OneApiSdk
  class Client
    module Characters
      # CHARACTER METHODS

      # List of characters including metadata like name, gender, realm, race and more
      # @param query_params [String] the query parameters you want to include in your search
      #  IE: "?sort=name:asc"
      # @return [Hash] The returned character object
      def characters(query_params="")
        response = call_with_token("#{Constants::CHARACTER_BASE_PATH}#{query_params}")
        JSON.parse(response.body)
      end

      # Request one specific character
      # @param id [String] the unique id of the character
      # @param query_params [String] the query parameters you want to include in your search
      #  IE: "?sort=name:asc"
      # @return [Hash] The returned character object
      def character(id,query_params="")
        response = call_with_token("#{Constants::CHARACTER_BASE_PATH}/#{id}#{query_params}")
        JSON.parse(response.body)
      end

      # Request all movie quotes for one specific character (only working for the LotR trilogy)
      # @param id [String] the unique id of the character
      # @param query_params [String] the query parameters you want to include in your search
      #  IE: "?sort=name:asc"
      # @return [Hash] The returned character quotes object
      def character_quotes(id, query_params="")
        response = call_with_token("#{Constants::CHARACTER_BASE_PATH}/#{id}/quote#{query_params}")
        JSON.parse(response.body)
      end
    end
  end
end
