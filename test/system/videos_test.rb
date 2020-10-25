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

    fill_in 'Name', with: 'That is a movie'
    fill_in 'Url', with: 'https://content.jwplatform.com/manifests/yp34SRmf.m3u8'
    # save_and_open_screenshot

    click_on 'Submit'
    # save_and_open_screenshot

    assert_equal video_path(Video.last), page.current_path
    assert_text 'That is a movie'
    # save_and_open_screenshot
  end

  test 'visiting a video' do
    visit "/videos/#{videos(:one).id}"
    # save_and_open_screenshot

    assert_selector 'h2', text: "You need to see this movie!"
  end

  test "updating a video's information" do
    login_as users(:one)
    visit "/videos/#{videos(:one).id}/edit"
    # save_and_open_screenshot

    fill_in 'Name', with: ' '
    fill_in 'Name', with: 'This movie is ok, at most.'
    # save_and_open_screenshot

    click_on 'Update'
    # save_and_open_screenshot

    assert_equal video_path(videos(:one).id), page.current_path
    assert_text 'This movie is ok, at most.'
    # save_and_open_screenshot
  end

