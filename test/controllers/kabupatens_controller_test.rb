require 'test_helper'

class KabupatensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kabupaten = kabupatens(:one)
  end

  test "should get index" do
    get kabupatens_url
    assert_response :success
  end

  test "should get new" do
    get new_kabupaten_url
    assert_response :success
  end

  test "should create kabupaten" do
    assert_difference('Kabupaten.count') do
      post kabupatens_url, params: { kabupaten: { nama: @kabupaten.nama, provinsi_id: @kabupaten.provinsi_id } }
    end
    assert_redirected_to kabupaten_url(Kabupaten.order("created_at").last)
  end

  test "should show kabupaten" do
    get kabupaten_url(@kabupaten)
    assert_response :success
  end

  test "should get edit" do
    get edit_kabupaten_url(@kabupaten)
    assert_response :success
  end

  test "should update kabupaten" do
    patch kabupaten_url(@kabupaten), params: { kabupaten: { nama: @kabupaten.nama, provinsi_id: @kabupaten.provinsi_id } }
    assert_redirected_to kabupaten_url(@kabupaten)
  end

  test "should destroy kabupaten" do
    assert_difference('Kabupaten.count', -1) do
      delete kabupaten_url(@kabupaten)
    end

    assert_redirected_to kabupatens_url
  end
end
