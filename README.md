# tweetmolisher

Tweetmolisher is a terminal application that allows you to
quickly browse your tweets and nuke the ones you no longer
want to have on your timeline

### Setup

- `bundle install`
- Create (or reuse) a [Twitter App](https://developer.twitter.com/en/apps)
- `touch .env`
- Use your Twitter App credentials to populate your `.env` as

```
CONSUMER_KEY        = "foo"
CONSUMER_SECRET     = "bar"
ACCESS_TOKEN        = "baz"
ACCESS_TOKEN_SECRET = "foo"
```

### Run

- `bundle exec ruby tweetmolisher.rb`
  - The script will list your tweets and prompt for removal
  - Tweets are listed chronologically from most recent to older
  - An optional `MAX_ID` env variable is supported to return tweets whose ID is less than (that is, older than) or equal to the specified ID
