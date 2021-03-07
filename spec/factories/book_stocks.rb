FactoryBot.define do
  factory :book_stock do
    book_store
    book
    stock_level { 10 }
    in_stock { true }
  end
end