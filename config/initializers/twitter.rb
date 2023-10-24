require 'x'
x_credentials={
  api_key: ENV["api_key"],
      api_key_secret: ENV["api_key_secret"],
        access_token: ENV["access_token"],
          access_token_secret: ENV["access_token_secret"]
}
p x_credentials

# Initialize an X API client with your OAuth credentials
Xclient = X::Client.new(**x_credentials)

# Get data about yourself
p Xclient.get("users/me")
p Xclient.get("users/me")
# {"data"=>{"id"=>"7505382", "name"=>"Erik Berlin", "username"=>"sferik"}}

# Post a tweet
tweet = Xclient.post("tweets", '{"text":"Hello, World! (from @gem)"}')
# {"data"=>{"edit_history_tweet_ids"=>["1234567890123456789"], "id"=>"1234567890123456789", "text"=>"Hello, World! (from @gem)"}}

# Delete the tweet you just posted
Xclient.delete("tweets/#{tweet["data"]["id"]}")
# {"data"=>{"deleted"=>true}}

# Initialize an API v1.1 client
V1_client = X::Client.new(base_url: "https://api.twitter.com/1.1/", **x_credentials)

# Request your account settings
V1_client.get("account/settings.json")

# Initialize an X Ads API client
Ads_client = X::Client.new(base_url: "https://ads-api.twitter.com/12/", **x_credentials)


# Request your ad accounts
#p ads_client.get("accounts")
