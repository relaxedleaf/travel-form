require 'test_helper'

class ReimFormMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reim_form_message = reim_form_messages(:one)
  end

  test "should get index" do
    get reim_form_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_reim_form_message_url
    assert_response :success
  end

  test "should create reim_form_message" do
    assert_difference('ReimFormMessage.count') do
      post reim_form_messages_url, params: { reim_form_message: { message: @reim_form_message.message, reimbusement_form_id: @reim_form_message.reimbusement_form_id, status_id: @reim_form_message.status_id } }
    end

    assert_redirected_to reim_form_message_url(ReimFormMessage.last)
  end

  test "should show reim_form_message" do
    get reim_form_message_url(@reim_form_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_reim_form_message_url(@reim_form_message)
    assert_response :success
  end

  test "should update reim_form_message" do
    patch reim_form_message_url(@reim_form_message), params: { reim_form_message: { message: @reim_form_message.message, reimbusement_form_id: @reim_form_message.reimbusement_form_id, status_id: @reim_form_message.status_id } }
    assert_redirected_to reim_form_message_url(@reim_form_message)
  end

  test "should destroy reim_form_message" do
    assert_difference('ReimFormMessage.count', -1) do
      delete reim_form_message_url(@reim_form_message)
    end

    assert_redirected_to reim_form_messages_url
  end
end
