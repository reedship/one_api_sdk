# frozen_string_literal: true

module OneApiSdk
  class Client
    module Characters
      # CHARACTER METHODS
      # TODO: CHECK RETURN VALUES

      # List of characters including metadata like name, gender, realm, race and more
      # @param options [Array<String>] The query parameters you want passed into the request, defaulting to an empty array.
      # @return [Array<Hash>] An array of characters
      def characters(options=[])
        response = call_with_token(Constants::CHARACTER_BASE_PATH)
        JSON.parse(response.body)
      end

      # Request one specific character
      # @param id [String] the unique id of the character
      # @param options [Array<String>] The query parameters you want passed into the request.
      # @return [Hash] The returned character object
      def character(id,options=[])
        response = call_with_token("#{Constants::CHARACTER_BASE_PATH}/#{id}", options)
        JSON.parse(response.body)
      end

      # Request all movie quotes for one specific character (only working for the LotR trilogy)
      # @param id [String] the unique id of the character
      # @param options [Array<String>] The query parameters you want passed into the request.
      # @return [Hash] The returned character quotes object
      def character_quotes(id,options=[])
        response = call_with_token("#{Constants::CHARACTER_BASE_PATH}/#{id}/chapter", options)
        JSON.parse(response.body)
      end
    end
  end
end
