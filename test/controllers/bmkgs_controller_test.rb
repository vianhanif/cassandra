require 'test_helper'

class BmkgsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    # @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:user)
    @bmkg = bmkgs(:one)
  end

  test "should get index" do
    get bmkgs_url
    assert_response :success
  end

  test "should get new" do
    get new_bmkg_url
    assert_response :success
  end

  test "should create bmkg" do
    assert_difference('Bmkg.count') do
      post bmkgs_url, params: { bmkg: { curah_hujan: @bmkg.curah_hujan, kelembaban_rata: @bmkg.kelembaban_rata, lama_penyinaran: @bmkg.lama_penyinaran, suhu_max: @bmkg.suhu_max, suhu_min: @bmkg.suhu_min, suhu_rata: @bmkg.suhu_rata, tanggal: @bmkg.tanggal } }
    end

    assert_redirected_to bmkg_url(Bmkg.last)
  end

  test "should show bmkg" do
    get bmkg_url(@bmkg)
    assert_response :success
  end

  test "should get edit" do
    get edit_bmkg_url(@bmkg)
    assert_response :success
  end

  test "should update bmkg" do
    patch bmkg_url(@bmkg), params: { bmkg: { curah_hujan: @bmkg.curah_hujan, kelembaban_rata: @bmkg.kelembaban_rata, lama_penyinaran: @bmkg.lama_penyinaran, suhu_max: @bmkg.suhu_max, suhu_min: @bmkg.suhu_min, suhu_rata: @bmkg.suhu_rata, tanggal: @bmkg.tanggal } }
    assert_redirected_to bmkg_url(@bmkg)
  end

  test "should destroy bmkg" do
    assert_difference('Bmkg.count', -1) do
      delete bmkg_url(@bmkg)
    end

    assert_redirected_to bmkgs_url
  end
end
