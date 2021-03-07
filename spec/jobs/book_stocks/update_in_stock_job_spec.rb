require 'rails_helper'

RSpec.describe BookStocks::UpdateInStockJob, type: :job do
  it "correctly sets `in_stock` of all book stocks" do
    book_stock_1 = create(:book_stock, in_stock: false, stock_level: 10)
    book_stock_2 = create(:book_stock, in_stock: true, stock_level: 0)
    book_stock_3 = create(:book_stock, in_stock: false, stock_level: 0)
    book_stock_4 = create(:book_stock, in_stock: true, stock_level: 10)

    BookStocks::UpdateInStockJob.perform_now
    [book_stock_1, book_stock_2, book_stock_3, book_stock_4].each(&:reload)

    expect(book_stock_1.in_stock).to eq(true)
    expect(book_stock_2.in_stock).to eq(false)
    expect(book_stock_3.in_stock).to eq(false)
    expect(book_stock_4.in_stock).to eq(true)
  end
end
