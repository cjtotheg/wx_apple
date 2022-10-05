require "test_helper"

class WxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wx = wxes(:one)
  end

  test "should get index" do
    get wxes_url
    assert_response :success
  end

  test "should get new" do
    get new_wx_url
    assert_response :success
  end

  test "should create wx" do
    assert_difference("Wx.count") do
      post wxes_url, params: { wx: { city: @wx.city, country: @wx.country, postal_code: @wx.postal_code, state_or_province: @wx.state_or_province, street: @wx.street } }
    end

    assert_redirected_to wx_url(Wx.last)
  end

  test "should show wx" do
    get wx_url(@wx)
    assert_response :success
  end

  test "should get edit" do
    get edit_wx_url(@wx)
    assert_response :success
  end

  test "should update wx" do
    patch wx_url(@wx), params: { wx: { city: @wx.city, country: @wx.country, postal_code: @wx.postal_code, state_or_province: @wx.state_or_province, street: @wx.street } }
    assert_redirected_to wx_url(@wx)
  end

  test "should destroy wx" do
    assert_difference("Wx.count", -1) do
      delete wx_url(@wx)
    end

    assert_redirected_to wxes_url
  end
end
