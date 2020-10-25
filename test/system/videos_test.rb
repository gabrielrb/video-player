require "application_system_test_case"

class VideosTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"
    # save_and_open_screenshot
    assert_selector "h2", text: "All videos"
    assert_selector ".card-product", count: Video.count
  end
end
