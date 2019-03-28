require 'test_helper'

class ReimbursementFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reimbursement_form = reimbursement_forms(:one)
  end

  test "should get index" do
    get reimbursement_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_reimbursement_form_url
    assert_response :success
  end

  test "should create reimbursement_form" do
    assert_difference('ReimbursementForm.count') do
      post reimbursement_forms_url, params: { reimbursement_form: { employee_id: @reimbursement_form.employee_id, status_id: @reimbursement_form.status_id, trip_id: @reimbursement_form.trip_id } }
    end

    assert_redirected_to reimbursement_form_url(ReimbursementForm.last)
  end

  test "should show reimbursement_form" do
    get reimbursement_form_url(@reimbursement_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_reimbursement_form_url(@reimbursement_form)
    assert_response :success
  end

  test "should update reimbursement_form" do
    patch reimbursement_form_url(@reimbursement_form), params: { reimbursement_form: { employee_id: @reimbursement_form.employee_id, status_id: @reimbursement_form.status_id, trip_id: @reimbursement_form.trip_id } }
    assert_redirected_to reimbursement_form_url(@reimbursement_form)
  end

  test "should destroy reimbursement_form" do
    assert_difference('ReimbursementForm.count', -1) do
      delete reimbursement_form_url(@reimbursement_form)
    end

    assert_redirected_to reimbursement_forms_url
  end
end
