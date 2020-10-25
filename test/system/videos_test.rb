require "application_system_test_case"

class VideosTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"
    # save_and_open_screenshot
    assert_selector "h2", text: "All videos"
    assert_selector ".card-product", count: Video.count
  end

  test 'creating a new video' do
    login_as users(:one)
    visit '/videos/new'
    # save_and_open_screenshot

    fill_in 'Name', with: 'You need to see this movie!'
    fill_in 'Url', with: 'https://content.jwplatform.com/manifests/yp34SRmf.m3u8'
    # save_and_open_screenshot

    click_on 'Submit'
    # save_and_open_screenshot

    assert_equal video_path(Video.last), page.current_path
    assert_text 'You need to see this movie!'
    save_and_open_screenshot
  end


end
