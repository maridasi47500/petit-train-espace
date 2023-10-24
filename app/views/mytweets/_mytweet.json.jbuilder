json.extract! mytweet, :id, :content, :hashtag_id, :tweet_id, :created_at, :updated_at
json.url mytweet_url(mytweet, format: :json)
