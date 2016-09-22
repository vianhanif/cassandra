require 'test_helper'

class ProvinsisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @provinsi = provinsis(:one)
  end

  test "should get index" do
    get provinsis_url
    assert_response :success
  end

  test "should get new" do
    get new_provinsi_url
    assert_response :success
  end

  test "should create provinsi" do
    assert_difference('Provinsi.count') do
      post provinsis_url, params: { provinsi: { nama: @provinsi.nama } }
    end

    assert_redirected_to provinsi_url(Provinsi.last)
  end

  test "should show provinsi" do
    get provinsi_url(@provinsi)
    assert_response :success
  end

  test "should get edit" do
    get edit_provinsi_url(@provinsi)
    assert_response :success
  end

  test "should update provinsi" do
    patch provinsi_url(@provinsi), params: { provinsi: { nama: @provinsi.nama } }
    assert_redirected_to provinsi_url(@provinsi)
  end

  test "should destroy provinsi" do
    assert_difference('Provinsi.count', -1) do
      delete provinsi_url(@provinsi)
    end

    assert_redirected_to provinsis_url
  end
end
