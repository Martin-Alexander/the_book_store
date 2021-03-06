require 'rails_helper'

RSpec.describe BookStockPolicy, type: :policy do
  subject { described_class }

  permissions ".scope" do
    let(:user)              { create(:user) }
    let(:my_book_stock)     { create(:book_stock, book_store: user.book_store) }
    let(:not_my_book_stock) { create(:book_stock) }

    it "only contains book stocks of your book store" do
      expect(BookStockPolicy::Scope.new(user, BookStock).resolve).to     include(my_book_stock)
      expect(BookStockPolicy::Scope.new(user, BookStock).resolve).not_to include(not_my_book_stock)
    end
  end

  permissions :create? do
    let(:user) { create(:user) }

    it "grants access to anyone" do
      expect(subject).to permit(user, BookStock.new)
    end
  end

  permissions :update?, :destroy? do
    let(:user)              { create(:user) }
    let(:not_my_book_store) { create(:book_store) }

    it "denies access if you're not the owner of the book store" do
      expect(subject).not_to permit(user, BookStock.new(book_store: not_my_book_store))
    end

    it "grants access if you own the book store" do
      expect(subject).to permit(user, BookStock.new(book_store: user.book_store))
    end
  end
end
