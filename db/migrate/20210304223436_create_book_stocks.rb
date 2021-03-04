class CreateBookStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :book_stocks do |t|
      t.references :book_store, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.integer :stock, null: false, default: 0
      t.boolean :in_stock, null: false, default: false

      t.timestamps
    end
  end
end
