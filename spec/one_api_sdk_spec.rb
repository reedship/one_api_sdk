require 'rubygems'
require 'spec_helper'
require 'vcr'
require 'one_api_sdk/client'
require_relative '../lib/one_api_sdk/client.rb'

VCR.config do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.stub_with :webmock
  c.default_cassette_options = { :record => :new_episodes }
end

RSpec.describe OneApiSdk do
  it "has a version number" do
    expect(OneApiSdk::VERSION).not_to be nil
  end
end

RSpec.describe OneApiSdk::Client do
  let(:adanel_id) {'5cd99d4bde30eff6ebccfbbe'}
  let(:fellowship_id) {'5cf5805fb53e011a64671582'}
  let(:return_of_the_king_movie_id) {'5cd95395de30eff6ebccde5d'}
  let(:quote_id) {'5cd96e05de30eff6ebcce7e9'}
  let(:chapter_id) {'6091b6d6d58360f988133b8b'}
  let(:client) { OneApiSdk::Client.new('fake')}

  describe "Book Methods" do
    it "gets all books without query parameters" do
      VCR.use_cassette("all_books") do
        response = client.books()
        expect(response["docs"].length).to be 3
      end
    end

    it "gets all books with a query parameter" do
      VCR.use_cassette("limited_books") do
        response = client.books('?limit=1')
        expect(response["docs"].length).to be 1
      end
    end

    it "gets a single book" do
      VCR.use_cassette('single book') do
        response = client.book(fellowship_id) #
        expect(response["docs"].length).to be 1
      end
    end
  end

  describe "Character Methods" do
    it "gets all characters" do
      VCR.use_cassette('all_characters') do
        response = client.characters()
        expect(response["docs"].length).to be > 1
      end
    end

    it "gets a single character" do
      VCR.use_cassette('single_character') do
        response = client.character(adanel_id)
        expect(response["docs"].length).to be 1
      end
    end
  end

  describe "Movie Methods" do
    it "gets all movies" do
      VCR.use_cassette('all_movies') do
        response = client.movies()
        expect(response["docs"].length).to be 8
      end
    end

    it "gets a single movie" do
      VCR.use_cassette('single_movies') do
        response = client.movie(return_of_the_king_movie_id)
        expect(response["docs"].length).to be 1
      end
    end

    it "gets a single movie's quotes" do
      VCR.use_cassette('single_movie_quote') do
        response = client.movie_quotes(return_of_the_king_movie_id)
        expect(response["docs"].length).to be 873
      end
    end
  end

  describe "Quote Methods" do
    it "gets all quotes" do
      VCR.use_cassette('all_quotes') do
        response = client.quotes()
        expect(response["docs"].length).to be 1000 #the default limit for an http response
      end
    end

    it "gets a single quote" do
      VCR.use_cassette('single_quote') do
        response = client.quote(quote_id)
        expect(response["docs"].length).to be 1
      end
    end

    it "gets all quotes by a single character" do
      VCR.use_cassette('single_character_quotes') do
        response = client.character_quotes(adanel_id)
        expect(response["docs"].length).to be 0 # adanel doesn't have any lines
      end
    end
  end

  describe "Chapter Methods" do
    it "gets all chapters" do
      VCR.use_cassette('all_chapters') do
        response = client.chapters()
        expect(response["docs"].length).to be 62
      end
    end

    it "gets all chapters for a single book" do
      VCR.use_cassette('fellowship_chapters') do
        response = client.book_chapters(fellowship_id)
        expect(response["docs"].length).to be 22
      end
    end

    it "gets a single chapter by id" do
      VCR.use_cassette('single_chapter') do
        response = client.chapter(chapter_id)
        expect(response["docs"].length).to be 1
        expect(response["docs"].first["chapterName"]).to eql("A Long-expected Party")
      end
    end
  end
end
