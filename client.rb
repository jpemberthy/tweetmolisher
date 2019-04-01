require "twitter"

require "dotenv"
Dotenv.load

class Client
  attr_reader :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
    end
  end

  def fetch_my_tweets(options = {})
    opts = {exclude_replies: false, include_rts: true, count: 20}.merge!(options)
    client.user_timeline(nil, opts)
  end

  def tweetmolish!(tweets)
    client.destroy_status(tweets)
  end
end
