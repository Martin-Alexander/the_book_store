class CreateBookStores < ActiveRecord::Migration[6.0]
  def change
    create_table :book_stores do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
