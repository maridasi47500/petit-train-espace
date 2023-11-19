class User < ApplicationRecord
def mytweets
Tweet.where("content like ?","%#{pseudo}%")
end
end
