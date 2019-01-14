require 'test_helper'

class RecordpaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recordpayment = recordpayments(:one)
  end

  test "should get index" do
    get recordpayments_url
    assert_response :success
  end

  test "should get new" do
    get new_recordpayment_url
    assert_response :success
  end

  test "should create recordpayment" do
    assert_difference('Recordpayment.count') do
      post recordpayments_url, params: { recordpayment: { amount: @recordpayment.amount, debt_id: @recordpayment.debt_id, user_id: @recordpayment.user_id } }
    end

    assert_redirected_to recordpayment_url(Recordpayment.last)
  end

  test "should show recordpayment" do
    get recordpayment_url(@recordpayment)
    assert_response :success
  end

  test "should get edit" do
    get edit_recordpayment_url(@recordpayment)
    assert_response :success
  end

  test "should update recordpayment" do
    patch recordpayment_url(@recordpayment), params: { recordpayment: { amount: @recordpayment.amount, debt_id: @recordpayment.debt_id, user_id: @recordpayment.user_id } }
    assert_redirected_to recordpayment_url(@recordpayment)
  end

  test "should destroy recordpayment" do
    assert_difference('Recordpayment.count', -1) do
      delete recordpayment_url(@recordpayment)
    end

    assert_redirected_to recordpayments_url
  end
end
