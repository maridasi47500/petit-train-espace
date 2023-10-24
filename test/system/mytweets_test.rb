require "application_system_test_case"

class MytweetsTest < ApplicationSystemTestCase
  setup do
    @mytweet = mytweets(:one)
  end

  test "visiting the index" do
    visit mytweets_url
    assert_selector "h1", text: "Mytweets"
  end

  test "should create mytweet" do
    visit mytweets_url
    click_on "New mytweet"

    fill_in "Content", with: @mytweet.content
    fill_in "Hashtag", with: @mytweet.hashtag_id
    fill_in "Tweet", with: @mytweet.tweet_id
    click_on "Create Mytweet"

    assert_text "Mytweet was successfully created"
    click_on "Back"
  end

  test "should update Mytweet" do
    visit mytweet_url(@mytweet)
    click_on "Edit this mytweet", match: :first

    fill_in "Content", with: @mytweet.content
    fill_in "Hashtag", with: @mytweet.hashtag_id
    fill_in "Tweet", with: @mytweet.tweet_id
    click_on "Update Mytweet"

    assert_text "Mytweet was successfully updated"
    click_on "Back"
  end

  test "should destroy Mytweet" do
    visit mytweet_url(@mytweet)
    click_on "Destroy this mytweet", match: :first

    assert_text "Mytweet was successfully destroyed"
  end
end
