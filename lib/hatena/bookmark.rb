# frozen_string_literal: true

require_relative "bookmark/version"
require_relative "bookmark/client"

module Hatena
  def self.credentials(params)
    @credentials = params
    Hatena::Bookmark.set_credentials(@credentials)
  end
  module Bookmark
    class Error < StandardError; end
    # Your code goes here...

    def self.set_credentials(params)
      @credentials = params
    end

    def self.credentials
      @credentials
    end

    def self.post(params)
      client = Client.new(Hatena::Bookmark.credentials)
      client.post(params)
    end
  end
end
