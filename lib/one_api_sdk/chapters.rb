# frozen_string_literal: true

module OneApiSdk
  class Client
    module Chapters
      # CHAPTER METHODS
      # TODO: CHECK RETURN VALUES

      # List all book chapters
      # @param query_params [String] the query parameters you want to include in your search
      #  IE: "?sort=name:asc"
      # @return [Array<Hash>] An array of chapters
      def chapters(query_params="")
        response = call_with_token("#{Constants::CHAPTER_BASE_PATH}#{query_params}")
        JSON.parse(response.body)
      end

      # Request one specific book chapter
      # @param id [String] the unique id of the chapter
      # @param options [Array<String>] The query parameters you want passed into the request.
      # @return [Hash] The returned chapter object
      def chapter(id,query_params="")
        response = call_with_token("#{Constants::CHAPTER_BASE_PATH}/#{id}#{query_params}")
        JSON.parse(response.body)
      end
    end
  end
end
