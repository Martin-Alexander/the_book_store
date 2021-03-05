class BookStore < ApplicationRecord
  has_many :book_stocks, dependent: :destroy
  has_many :books, through: :book_stocks
  has_many :users

  validates :name, presence: true

  before_destroy :remove_foreign_key_from_users

  private

  def remove_foreign_key_from_users
    users.update_all book_store_id: nil
  end
end
