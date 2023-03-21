class AddGroupRefToGroupExpenses < ActiveRecord::Migration[7.0]
  def change
    add_reference :group_expenses, :groups, null: false, foreign_key: { to_table: 'groups' }
  end
end
