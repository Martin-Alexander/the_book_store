class AddBookStoreToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :book_store, foreign_key: true
  end
end
