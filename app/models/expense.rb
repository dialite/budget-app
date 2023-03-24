class Expense < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :group_expenses
  has_many :groups, through: :group_expenses

  has_one_attached :icon

  validates :name, :amount, presence: true
  validates :amount, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
end
