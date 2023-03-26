class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :groups, class_name: 'Group', foreign_key: 'user_id', dependent: :destroy
  has_many :expenses, class_name: 'Expense', foreign_key: 'user_id', dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def admin?
    role.present? && role == 'admin'
  end
end
