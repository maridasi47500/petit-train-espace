class Tweet < ApplicationRecord
  belongs_to :hashtag
  before_initialize do
    tweet = x_client.post("tweets", '{"text":"'+self.content+'"}')

    self.tweet_id=tweet["data"]["id"]
  end
end
