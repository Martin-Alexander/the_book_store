require 'rails_helper'

RSpec.describe BookStock, type: :model do
  subject { create(:book_stock) }

  it { should validate_presence_of(:stock) }
  it { should validate_presence_of(:in_stock) }
  it { should validate_numericality_of(:stock).only_integer.is_greater_than_or_equal_to(0) }
  it { should belong_to(:book) }
  it { should belong_to(:book_store) }
end
