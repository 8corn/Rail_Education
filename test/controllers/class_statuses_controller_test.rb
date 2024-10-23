require 'test_helper'

class ClassStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_status = class_statuses(:one)
  end

  test "should get index" do
    get class_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_class_status_url
    assert_response :success
  end

  test "should create class_status" do
    assert_difference('ClassStatus.count') do
      post class_statuses_url, params: { class_status: { class_list_id: @class_status.class_list_id, user_id: @class_status.user_id } }
    end

    assert_redirected_to class_status_url(ClassStatus.last)
  end

  test "should show class_status" do
    get class_status_url(@class_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_status_url(@class_status)
    assert_response :success
  end

  test "should update class_status" do
    patch class_status_url(@class_status), params: { class_status: { class_list_id: @class_status.class_list_id, user_id: @class_status.user_id } }
    assert_redirected_to class_status_url(@class_status)
  end

  test "should destroy class_status" do
    assert_difference('ClassStatus.count', -1) do
      delete class_status_url(@class_status)
    end

    assert_redirected_to class_statuses_url
  end
end
