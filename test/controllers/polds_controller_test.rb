require 'test_helper'

class PoldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pold = polds(:one)
  end

  test "should get index" do
    get polds_url
    assert_response :success
  end

  test "should get new" do
    get new_pold_url
    assert_response :success
  end

  test "should create pold" do
    assert_difference('Pold.count') do
      post polds_url, params: { pold: { h1: @pold.h1, h2: @pold.h2, h3: @pold.h3, h4: @pold.h4, h5: @pold.h5, h6: @pold.h6, h7: @pold.h7, keterangan: @pold.keterangan, pola: @pold.pola } }
    end

    assert_redirected_to pold_url(Pold.last)
  end

  test "should show pold" do
    get pold_url(@pold)
    assert_response :success
  end

  test "should get edit" do
    get edit_pold_url(@pold)
    assert_response :success
  end

  test "should update pold" do
    patch pold_url(@pold), params: { pold: { h1: @pold.h1, h2: @pold.h2, h3: @pold.h3, h4: @pold.h4, h5: @pold.h5, h6: @pold.h6, h7: @pold.h7, keterangan: @pold.keterangan, pola: @pold.pola } }
    assert_redirected_to pold_url(@pold)
  end

  test "should destroy pold" do
    assert_difference('Pold.count', -1) do
      delete pold_url(@pold)
    end

    assert_redirected_to polds_url
  end
end
