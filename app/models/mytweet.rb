class Mytweet < ActiveRecord::Base
  belongs_to :hashtag
  before_validation :myfunc
  def myfunc
    tweet = Xclient.post("tweets", '{"text":"'+self.content+'"}')

    self.tweet_id=tweet["data"]["id"]
  end
end
