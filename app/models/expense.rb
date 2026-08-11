class Expense < ApplicationRecord
  validates :title, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :category, presence: true
  validates :date, presence: true
end