class BookStock < ApplicationRecord
  belongs_to :book_store
  belongs_to :book

  validates :stock_level, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_in_stock_to_reflect_stock_level!
    update(in_stock: !stock_level.zero?)
  end
end
