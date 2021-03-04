class Book < ApplicationRecord
  has_many :book_stocks, dependent: :destroy
end
