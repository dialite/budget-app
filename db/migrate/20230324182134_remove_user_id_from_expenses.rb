class RemoveAuthorIdFromExpenses < ActiveRecord::Migration[7.0]
  def change
    remove_column :expenses, :author_id
  end
end
