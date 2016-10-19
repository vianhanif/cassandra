require 'test_helper'

class KeywordsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    # @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:user)
    @keyword = keywords(:one)
  end

  test "should get index" do
    get keywords_url
    assert_response :success
  end

  test "should get new" do
    get new_keyword_url
    assert_response :success
  end

  test "should create keyword" do
    assert_difference('Keyword.count') do
      post keywords_url, params: { keyword: { bencana_id: @keyword.bencana_id, nama: @keyword.nama } }
    end

    assert_redirected_to keyword_url(Keyword.last)
  end

  test "should show keyword" do
    get keyword_url(@keyword)
    assert_response :success
  end

  test "should get edit" do
    get edit_keyword_url(@keyword)
    assert_response :success
  end

  test "should update keyword" do
    patch keyword_url(@keyword), params: { keyword: { bencana_id: @keyword.bencana_id, nama: @keyword.nama } }
    assert_redirected_to keyword_url(@keyword)
  end

  test "should destroy keyword" do
    assert_difference('Keyword.count', -1) do
      delete keyword_url(@keyword)
    end

    assert_redirected_to keywords_url
  end
end
