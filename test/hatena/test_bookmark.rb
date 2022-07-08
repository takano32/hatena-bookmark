# frozen_string_literal: true

require "test_helper"

class Hatena::TestBookmark < Minitest::Test
  def setup
    @credentials = {
      consumer_key:    ENV['HATENA_API_CONSUMER_KEY'],
      consumer_secret: ENV['HATENA_API_CONSUMER_SECRET'],
      request_token:   ENV['HATENA_API_REQUEST_TOKEN'],
      request_secret:  ENV['HATENA_API_REQUEST_SECRET']
    }

    ::Hatena.credentials(@credentials)
    @client = ::Hatena::Bookmark::Client.new(@credentials)
  end

  def test_that_it_has_a_version_number
    refute_nil ::Hatena::Bookmark::VERSION
  end

  def test_bookmark_post
    ret = ::Hatena::Bookmark.post(
      :url => 'http://www.example.com/',
      :comment => rand
    )
    assert ret == true
  end

  def test_bookmark_client_post
    ret = @client.post(
      :url => 'http://www.example.com/',
      :comment => rand)
    assert ret == true
  end

  def test_it_does_something_useful
    assert true
  end
end
