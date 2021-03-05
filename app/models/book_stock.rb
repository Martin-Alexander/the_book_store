class BookStock < ApplicationRecord
  belongs_to :book_store
  belongs_to :book

  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :in_stock, presence: true
end
