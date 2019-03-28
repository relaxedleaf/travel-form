require 'test_helper'

class AuthorizationFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @authorization_form = authorization_forms(:one)
  end

  test "should get index" do
    get authorization_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_authorization_form_url
    assert_response :success
  end

  test "should create authorization_form" do
    assert_difference('AuthorizationForm.count') do
      post authorization_forms_url, params: { authorization_form: { employee_id: @authorization_form.employee_id, status_id: @authorization_form.status_id, trip_id: @authorization_form.trip_id } }
    end

    assert_redirected_to authorization_form_url(AuthorizationForm.last)
  end

  test "should show authorization_form" do
    get authorization_form_url(@authorization_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_authorization_form_url(@authorization_form)
    assert_response :success
  end

  test "should update authorization_form" do
    patch authorization_form_url(@authorization_form), params: { authorization_form: { employee_id: @authorization_form.employee_id, status_id: @authorization_form.status_id, trip_id: @authorization_form.trip_id } }
    assert_redirected_to authorization_form_url(@authorization_form)
  end

  test "should destroy authorization_form" do
    assert_difference('AuthorizationForm.count', -1) do
      delete authorization_form_url(@authorization_form)
    end

    assert_redirected_to authorization_forms_url
  end
end
