require "application_system_test_case"

class GroupExpensesTest < ApplicationSystemTestCase
  setup do
    @group_expense = group_expenses(:one)
  end

  test "visiting the index" do
    visit group_expenses_url
    assert_selector "h1", text: "Group expenses"
  end

  test "should create group expense" do
    visit group_expenses_url
    click_on "New group expense"

    click_on "Create Group expense"

    assert_text "Group expense was successfully created"
    click_on "Back"
  end

  test "should update Group expense" do
    visit group_expense_url(@group_expense)
    click_on "Edit this group expense", match: :first

    click_on "Update Group expense"

    assert_text "Group expense was successfully updated"
    click_on "Back"
  end

  test "should destroy Group expense" do
    visit group_expense_url(@group_expense)
    click_on "Destroy this group expense", match: :first

    assert_text "Group expense was successfully destroyed"
  end
end
