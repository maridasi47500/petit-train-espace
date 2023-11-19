class Mytweet < ActiveRecord::Base
  belongs_to :hashtag
  accepts_nested_attributes_for :hashtag
  attr_accessor :myhashtag
  before_validation :myfunc
  def myfunc
    if self.myhashtag.to_s.length > 0
      self.hashtag=Hashtag.find_or_initialize_by(name: "myhashtag")
    end
    tweet = Xclient.post("tweets", '{"text":"'+self.content+'"}')

    self.tweet_id=tweet["data"]["id"]
  end
end
