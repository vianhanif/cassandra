require 'test_helper'

class SosialmediasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sosialmedia = sosialmedias(:one)
  end

  test "should get index" do
    get sosialmedias_url
    assert_response :success
  end

  test "should get new" do
    get new_sosialmedia_url
    assert_response :success
  end

  test "should create sosialmedia" do
    assert_difference('Sosialmedia.count') do
      post sosialmedias_url, params: { sosialmedia: { bencana_id: @sosialmedia.bencana_id, link: @sosialmedia.link, tanggal: @sosialmedia.tanggal } }
    end

    assert_redirected_to sosialmedia_url(Sosialmedia.last)
  end

  test "should show sosialmedia" do
    get sosialmedia_url(@sosialmedia)
    assert_response :success
  end

  test "should get edit" do
    get edit_sosialmedia_url(@sosialmedia)
    assert_response :success
  end

  test "should update sosialmedia" do
    patch sosialmedia_url(@sosialmedia), params: { sosialmedia: { bencana_id: @sosialmedia.bencana_id, link: @sosialmedia.link, tanggal: @sosialmedia.tanggal } }
    assert_redirected_to sosialmedia_url(@sosialmedia)
  end

  test "should destroy sosialmedia" do
    assert_difference('Sosialmedia.count', -1) do
      delete sosialmedia_url(@sosialmedia)
    end

    assert_redirected_to sosialmedias_url
  end
end
