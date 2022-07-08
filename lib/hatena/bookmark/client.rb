require_relative "./version"

require 'faraday'
require 'faraday_middleware'
require 'json'

class Hatena::Bookmark::Client
  def initialize(params)
    @credentials = {
      consumer_key:    params[:consumer_key],
      consumer_secret: params[:consumer_secret],
      token:           params[:request_token],
      token_secret:    params[:request_secret]
    }
  end

  def request(method, params)
    url = 'https://bookmark.hatenaapis.com/rest/1/my/bookmark'    
    res = connection(url).send(method, url, params)
    attrs = JSON.parse(res.body)
    res.success?
  end

  def get(params)
    request(:get, params)
  end

  def post(params)
    request(:post, params)
  end

  def delete(params)
    request(:delete, params)
  end

  private
  def connection(url)
    Faraday::Connection.new(url: url) do |builder|
      builder.request(:url_encoded)
      builder.options.params_encoder = Faraday::FlatParamsEncoder
      builder.request :oauth, @credentials
      builder.headers["User-Agent"] = "hatena-bookmark"
      builder.adapter Faraday.default_adapter
    end
  end
end