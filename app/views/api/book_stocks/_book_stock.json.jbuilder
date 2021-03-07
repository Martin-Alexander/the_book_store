json.id book_stock.id
json.stock book_stock.stock
json.in_stock book_stock.in_stock
json.created_at book_stock.created_at
json.updated_at book_stock.updated_at

json.book do
  json.id book_stock.book.id
  json.title book_stock.book.title
end

json.book_store do
  json.id book_stock.book_store.id
  json.name book_stock.book_store.name
end