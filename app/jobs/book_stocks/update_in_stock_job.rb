class BookStocks::UpdateInStockJob < ApplicationJob
  queue_as :default

  def perform
    BookStock.find_each do |book_stock|
      book_stock.update_in_stock_to_reflect_stock_level!
    end
  end
end
