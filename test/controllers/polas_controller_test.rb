require 'test_helper'

class PolasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pola = polas(:one)
  end

  test "should get index" do
    get polas_url
    assert_response :success
  end

  test "should get new" do
    get new_pola_url
    assert_response :success
  end

  test "should create pola" do
    assert_difference('Pola.count') do
      post polas_url, params: { pola: { bnpb_id: @pola.bnpb_id, h1: @pola.h1, h2: @pola.h2, h3: @pola.h3, h4: @pola.h4, h5: @pola.h5, h6: @pola.h6, h7: @pola.h7, keterangan: @pola.keterangan, polanya: @pola.polanya } }
    end

    assert_redirected_to pola_url(Pola.last)
  end

  test "should show pola" do
    get pola_url(@pola)
    assert_response :success
  end

  test "should get edit" do
    get edit_pola_url(@pola)
    assert_response :success
  end

  test "should update pola" do
    patch pola_url(@pola), params: { pola: { bnpb_id: @pola.bnpb_id, h1: @pola.h1, h2: @pola.h2, h3: @pola.h3, h4: @pola.h4, h5: @pola.h5, h6: @pola.h6, h7: @pola.h7, keterangan: @pola.keterangan, polanya: @pola.polanya } }
    assert_redirected_to pola_url(@pola)
  end

  test "should destroy pola" do
    assert_difference('Pola.count', -1) do
      delete pola_url(@pola)
    end

    assert_redirected_to polas_url
  end
end
