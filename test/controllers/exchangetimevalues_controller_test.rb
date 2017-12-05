require 'test_helper'

class ExchangetimevaluesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get exchangetimevalues_show_url
    assert_response :success
  end

  test "should get new" do
    get exchangetimevalues_new_url
    assert_response :success
  end

  test "should get create" do
    get exchangetimevalues_create_url
    assert_response :success
  end

  test "should get edit" do
    get exchangetimevalues_edit_url
    assert_response :success
  end

  test "should get update" do
    get exchangetimevalues_update_url
    assert_response :success
  end

end
