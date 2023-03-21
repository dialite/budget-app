require "test_helper"

class GroupExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_expense = group_expenses(:one)
  end

  test "should get index" do
    get group_expenses_url
    assert_response :success
  end

  test "should get new" do
    get new_group_expense_url
    assert_response :success
  end

  test "should create group_expense" do
    assert_difference("GroupExpense.count") do
      post group_expenses_url, params: { group_expense: {  } }
    end

    assert_redirected_to group_expense_url(GroupExpense.last)
  end

  test "should show group_expense" do
    get group_expense_url(@group_expense)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_expense_url(@group_expense)
    assert_response :success
  end

  test "should update group_expense" do
    patch group_expense_url(@group_expense), params: { group_expense: {  } }
    assert_redirected_to group_expense_url(@group_expense)
  end

  test "should destroy group_expense" do
    assert_difference("GroupExpense.count", -1) do
      delete group_expense_url(@group_expense)
    end

    assert_redirected_to group_expenses_url
  end
end
