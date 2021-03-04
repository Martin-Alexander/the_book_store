class User < ApplicationRecord
  acts_as_token_authenticatable

  belongs_to :book_store, optional: true

  devise :database_authenticatable, :lockable, :rememberable
end
