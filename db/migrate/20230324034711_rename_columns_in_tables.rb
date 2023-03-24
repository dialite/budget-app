class RenameColumnsInTables < ActiveRecord::Migration[7.0]
  def change
    rename_column :group_expenses, :expenses_id, :expense_id
    rename_column :group_expenses, :groups_id, :group_id
  end
end
