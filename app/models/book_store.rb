class BookStore < ApplicationRecord
  has_many :book_stocks, dependent: :destroy
  has_many :books, through: :book_stocks
end
