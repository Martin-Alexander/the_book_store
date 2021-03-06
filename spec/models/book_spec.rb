require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { create(:book) }

  it { should validate_presence_of(:title) }
  it { should have_many(:book_stocks) }
end
