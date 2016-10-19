require 'test_helper'

class BencanasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bencana = bencanas(:one)
  end

  test "should get index" do
    get bencanas_url
    assert_response :success
  end

  test "should get new" do
    get new_bencana_url
    assert_response :success
  end

  test "should create bencana" do
    assert_difference('Bencana.count') do
      post bencanas_url, params: { bencana: { nama: @bencana.nama } }
    end

    assert_redirected_to bencana_url(Bencana.last)
  end

  test "should show bencana" do
    get bencana_url(@bencana)
    assert_response :success
  end

  test "should get edit" do
    get edit_bencana_url(@bencana)
    assert_response :success
  end

  test "should update bencana" do
    patch bencana_url(@bencana), params: { bencana: { nama: @bencana.nama } }
    assert_redirected_to bencana_url(@bencana)
  end

  test "should destroy bencana" do
    assert_difference('Bencana.count', -1) do
      delete bencana_url(@bencana)
    end

    assert_redirected_to bencanas_url
  end
end
