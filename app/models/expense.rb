class Expense < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :group_expenses, class_name: 'GroupExpense', foreign_key: 'expense_id', dependent: :destroy
  has_many :groups, through: :group_expenses

  validates :name, :amount, presence: true
  validates :amount, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
end
