require "application_system_test_case"

class WxesTest < ApplicationSystemTestCase
  setup do
    @wx = wxes(:one)
  end

  test "visiting the index" do
    visit wxes_url
    assert_selector "h1", text: "Wxes"
  end

  test "should create wx" do
    visit wxes_url
    click_on "New wx"

    fill_in "City", with: @wx.city
    fill_in "Country", with: @wx.country
    fill_in "Postal code", with: @wx.postal_code
    fill_in "State or province", with: @wx.state_or_province
    fill_in "Street", with: @wx.street
    click_on "Create Wx"

    assert_text "Wx was successfully created"
    click_on "Back"
  end

  test "should update Wx" do
    visit wx_url(@wx)
    click_on "Edit this wx", match: :first

    fill_in "City", with: @wx.city
    fill_in "Country", with: @wx.country
    fill_in "Postal code", with: @wx.postal_code
    fill_in "State or province", with: @wx.state_or_province
    fill_in "Street", with: @wx.street
    click_on "Update Wx"

    assert_text "Wx was successfully updated"
    click_on "Back"
  end

  test "should destroy Wx" do
    visit wx_url(@wx)
    click_on "Destroy this wx", match: :first

    assert_text "Wx was successfully destroyed"
  end
end
