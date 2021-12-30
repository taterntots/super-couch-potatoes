require "application_system_test_case"

class MediaTest < ApplicationSystemTestCase
  setup do
    @medium = media(:one)
  end

  test "visiting the index" do
    visit media_url
    assert_selector "h1", text: "Media"
  end

  test "should create medium" do
    visit media_url
    click_on "New medium"

    fill_in "Date completed", with: @medium.date_completed
    check "First time" if @medium.first_time
    fill_in "Img url", with: @medium.img_URL
    fill_in "Media type", with: @medium.media_type
    fill_in "Rating", with: @medium.rating
    fill_in "Title", with: @medium.title
    fill_in "User", with: @medium.user_id
    click_on "Create Medium"

    assert_text "Medium was successfully created"
    click_on "Back"
  end

  test "should update Medium" do
    visit medium_url(@medium)
    click_on "Edit this medium", match: :first

    fill_in "Date completed", with: @medium.date_completed
    check "First time" if @medium.first_time
    fill_in "Img url", with: @medium.img_URL
    fill_in "Media type", with: @medium.media_type
    fill_in "Rating", with: @medium.rating
    fill_in "Title", with: @medium.title
    fill_in "User", with: @medium.user_id
    click_on "Update Medium"

    assert_text "Medium was successfully updated"
    click_on "Back"
  end

  test "should destroy Medium" do
    visit medium_url(@medium)
    click_on "Destroy this medium", match: :first

    assert_text "Medium was successfully destroyed"
  end
end
