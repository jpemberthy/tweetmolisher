require "tty-prompt"
require "tty-spinner"

require_relative "./client"

prompt = TTY::Prompt.new
spinner = TTY::Spinner.new("[:spinner] Tweetmolishing ...")

client = Client.new

max_id = ENV["MAX_ID"]
running = true

while running
  options = {count: 2}
  options[:max_id] = max_id unless max_id.nil?
  deletable = []

  tweets = client.fetch_my_tweets(options)
  tweets.each do |tweet|
    next if tweet.id == max_id


    puts "\e[34m#{tweet.created_at}\e[0m #{tweet.full_text} #{tweet.url}"
    begin
      deletable << tweet if prompt.yes?("Nuke?")
    rescue TTY::Prompt::ConversionError
    end
  end

  if deletable.any?
    spinner.auto_spin
    client.tweetmolish!(deletable)
    spinner.stop
  end

  running = max_id != tweets.last.id
  max_id = tweets.last.id
  puts "Last MAX_ID #{max_id}"
end
