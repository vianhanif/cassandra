require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get informasi" do
    get informasi_url
    assert_response :success
  end

  test "should get data" do
    get data_url
    assert_response :success
  end

  test "should get ramalan" do
    get ramalan_url
    assert_response :success
  end

  test "should get info" do
    get info_url
    assert_response :success
  end

  test "should get about" do
    get about_url
    assert_response :success
  end

end
