require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get informasi" do
    get static_pages_informasi_url
    assert_response :success
  end

  test "should get data" do
    get static_pages_data_url
    assert_response :success
  end

  test "should get ramalan" do
    get static_pages_ramalan_url
    assert_response :success
  end

  test "should get info" do
    get static_pages_info_url
    assert_response :success
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end

end
