FactoryBot.define do
  factory :book_stock do
    book_store
    book
    stock { 10 }
    in_stock { true }
  end
end