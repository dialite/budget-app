class Expense < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :group_expenses, class_name: 'GroupExpense', foreign_key: 'expense_id'
end
