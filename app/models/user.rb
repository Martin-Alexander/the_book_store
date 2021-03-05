class User < ApplicationRecord
  acts_as_token_authenticatable
  devise :database_authenticatable, :lockable, :rememberable, :validatable

  belongs_to :book_store, optional: true
end
