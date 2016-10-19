require 'test_helper'

class StasiunsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    # @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:user)
    @stasiun = stasiuns(:one)
  end

  test "should get index" do
    get stasiuns_url
    assert_response :success
  end

  test "should get new" do
    get new_stasiun_url
    assert_response :success
  end

  test "should create stasiun" do
    assert_difference('Stasiun.count') do
      post stasiuns_url, params: { stasiun: { nama: @stasiun.nama, provinsi_id: @stasiun.provinsi_id } }
    end

    assert_redirected_to stasiun_url(Stasiun.last)
  end

  test "should show stasiun" do
    get stasiun_url(@stasiun)
    assert_response :success
  end

  test "should get edit" do
    get edit_stasiun_url(@stasiun)
    assert_response :success
  end

  test "should update stasiun" do
    patch stasiun_url(@stasiun), params: { stasiun: { nama: @stasiun.nama, provinsi_id: @stasiun.provinsi_id } }
    assert_redirected_to stasiun_url(@stasiun)
  end

  test "should destroy stasiun" do
    assert_difference('Stasiun.count', -1) do
      delete stasiun_url(@stasiun)
    end

    assert_redirected_to stasiuns_url
  end
end
