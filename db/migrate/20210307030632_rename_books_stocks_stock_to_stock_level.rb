class RenameBooksStocksStockToStockLevel < ActiveRecord::Migration[6.0]
  def change
    rename_column :book_stocks, :stock, :stock_level
  end
end
