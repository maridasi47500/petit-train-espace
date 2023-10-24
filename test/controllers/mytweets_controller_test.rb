require "test_helper"

class MytweetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mytweet = mytweets(:one)
  end

  test "should get index" do
    get mytweets_url
    assert_response :success
  end

  test "should get new" do
    get new_mytweet_url
    assert_response :success
  end

  test "should create mytweet" do
    assert_difference("Mytweet.count") do
      post mytweets_url, params: { mytweet: { content: @mytweet.content, hashtag_id: @mytweet.hashtag_id, tweet_id: @mytweet.tweet_id } }
    end

    assert_redirected_to mytweet_url(Mytweet.last)
  end

  test "should show mytweet" do
    get mytweet_url(@mytweet)
    assert_response :success
  end

  test "should get edit" do
    get edit_mytweet_url(@mytweet)
    assert_response :success
  end

  test "should update mytweet" do
    patch mytweet_url(@mytweet), params: { mytweet: { content: @mytweet.content, hashtag_id: @mytweet.hashtag_id, tweet_id: @mytweet.tweet_id } }
    assert_redirected_to mytweet_url(@mytweet)
  end

  test "should destroy mytweet" do
    assert_difference("Mytweet.count", -1) do
      delete mytweet_url(@mytweet)
    end

    assert_redirected_to mytweets_url
  end
end
