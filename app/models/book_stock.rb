class BookStock < ApplicationRecord
  belongs_to :book_store
  belongs_to :book
end
