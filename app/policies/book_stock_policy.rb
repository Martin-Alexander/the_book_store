class BookStockPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(book_store: :users).where(users: { id: user.id })
    end
  end

  def create?
    true
  end

  def update?
    record_belongs_to_your_book_store?
  end

  def destroy?
    record_belongs_to_your_book_store?
  end

  private

  def record_belongs_to_your_book_store?
    record.book_store == user.book_store
  end
end
