# frozen_string_literal: true

module OneApiSdk
  class Client
    module Chapters
      # CHAPTER METHODS
      # TODO: CHECK RETURN VALUES

      # List all book chapters
      # @param options [Array<String>] The query parameters you want passed into the request, defaulting to an empty array.
      # @return [Array<Hash>] An array of chapters
      def chapters(options=[])
        response = call_with_token(Constants::CHAPTER_BASE_PATH, options)
        JSON.parse(response.body)
      end

      # Request one specific book chapter
      # @param id [String] the unique id of the chapter
      # @param options [Array<String>] The query parameters you want passed into the request.
      # @return [Hash] The returned chapter object
      def chapter(id,options=[])
        response = call_with_token("#{Constants::CHAPTER_BASE_PATH}/#{id}", options)
        JSON.parse(response.body)
      end
    end
  end
end
