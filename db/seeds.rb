class ActiveRecord::Base
  after_create :log_attributes

  def log_attributes
    p attributes
  end
end

puts "Cleaning database"
Book.destroy_all
BookStore.destroy_all
User.destroy_all

books = 20.times.map do
  puts "Creating book"
  Book.create! title: Faker::Book.title
end

5.times do |n|
  puts "Creating book store"
  book_store = BookStore.create! name: Faker::Company.name

  puts "Creating book stocks"
  books.sample(10).each do |book|
    stock = rand(0..10)
    book_store.book_stocks.create! book: book, stock: stock, in_stock: stock.zero?
  end

  puts "Creating user"
  book_store.users.create! email: "user#{n}@email.com", password: "123456"
end

