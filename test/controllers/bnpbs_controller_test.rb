require 'test_helper'

class BnpbsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bnpb = bnpbs(:one)
  end

  test "should get index" do
    get bnpbs_url
    assert_response :success
  end

  test "should get new" do
    get new_bnpb_url
    assert_response :success
  end

  test "should create bnpb" do
    assert_difference('Bnpb.count') do
      post bnpbs_url, params: { bnpb: { bencana_id: @bnpb.bencana_id, kabupaten_id: @bnpb.kabupaten_id, korban_hilang: @bnpb.korban_hilang, korban_luka: @bnpb.korban_luka, korban_mengungsi: @bnpb.korban_mengungsi, korban_meninggal: @bnpb.korban_meninggal, tanggal: @bnpb.tanggal } }
    end

    assert_redirected_to bnpb_url(Bnpb.last)
  end

  test "should show bnpb" do
    get bnpb_url(@bnpb)
    assert_response :success
  end

  test "should get edit" do
    get edit_bnpb_url(@bnpb)
    assert_response :success
  end

  test "should update bnpb" do
    patch bnpb_url(@bnpb), params: { bnpb: { bencana_id: @bnpb.bencana_id, kabupaten_id: @bnpb.kabupaten_id, korban_hilang: @bnpb.korban_hilang, korban_luka: @bnpb.korban_luka, korban_mengungsi: @bnpb.korban_mengungsi, korban_meninggal: @bnpb.korban_meninggal, tanggal: @bnpb.tanggal } }
    assert_redirected_to bnpb_url(@bnpb)
  end

  test "should destroy bnpb" do
    assert_difference('Bnpb.count', -1) do
      delete bnpb_url(@bnpb)
    end

    assert_redirected_to bnpbs_url
  end
end
