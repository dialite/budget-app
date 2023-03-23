class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :group_expenses, class_name: 'GroupExpense', foreign_key: 'group_id', dependent: :destroy
  has_many :expenses, through: :group_expenses

  has_one_attached :icon
  validates :name, presence: true
end
