require 'test_helper'

class ReceiptsRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receipts_request = receipts_requests(:one)
  end

  test "should get index" do
    get receipts_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_receipts_request_url
    assert_response :success
  end

  test "should create receipts_request" do
    assert_difference('ReceiptsRequest.count') do
      post receipts_requests_url, params: { receipts_request: {  total_amount: @receipts_request. total_amount, department_id: @receipts_request.department_id, reimbursement_form_id: @receipts_request.reimbursement_form_id } }
    end

    assert_redirected_to receipts_request_url(ReceiptsRequest.last)
  end

  test "should show receipts_request" do
    get receipts_request_url(@receipts_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_receipts_request_url(@receipts_request)
    assert_response :success
  end

  test "should update receipts_request" do
    patch receipts_request_url(@receipts_request), params: { receipts_request: {  total_amount: @receipts_request. total_amount, department_id: @receipts_request.department_id, reimbursement_form_id: @receipts_request.reimbursement_form_id } }
    assert_redirected_to receipts_request_url(@receipts_request)
  end

  test "should destroy receipts_request" do
    assert_difference('ReceiptsRequest.count', -1) do
      delete receipts_request_url(@receipts_request)
    end

    assert_redirected_to receipts_requests_url
  end
end
