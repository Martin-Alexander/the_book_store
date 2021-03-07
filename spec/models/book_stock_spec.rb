require 'rails_helper'

RSpec.describe BookStock, type: :model do
  subject { create(:book_stock) }

  it { should validate_presence_of(:stock_level) }
  it { should validate_numericality_of(:stock_level).only_integer.is_greater_than_or_equal_to(0) }
  it { should belong_to(:book) }
  it { should belong_to(:book_store) }

  describe "#update_in_stock_to_reflect_stock_level!" do
    it "properly sets `in_stock`" do
      book_stock_1 = create(:book_stock, in_stock: false, stock_level: 10)

      expect do
        book_stock_1.update_in_stock_to_reflect_stock_level!
        book_stock_1.reload
      end.to change(book_stock_1, :in_stock).to(true)

      book_stock_2 = create(:book_stock, in_stock: true, stock_level: 0)

      expect do
        book_stock_2.update_in_stock_to_reflect_stock_level!
        book_stock_2.reload
      end.to change(book_stock_2, :in_stock).to(false)
    end
  end
end
