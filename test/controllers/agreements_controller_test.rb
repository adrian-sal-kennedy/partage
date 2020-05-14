require 'test_helper'

class AgreementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get agreements_index_url
    assert_response :success
  end

  test "should get show" do
    get agreements_show_url
    assert_response :success
  end

  test "should get new" do
    get agreements_new_url
    assert_response :success
  end

  test "should get create" do
    get agreements_create_url
    assert_response :success
  end

  test "should get update" do
    get agreements_update_url
    assert_response :success
  end

  test "should get destroy" do
    get agreements_destroy_url
    assert_response :success
  end

end
