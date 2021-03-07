require 'rails_helper'

RSpec.describe BookPolicy, type: :policy do
  subject { described_class }

  permissions ".scope" do
    let(:user) { create(:user) }
    let(:book) { create(:book) }

    it "only contains book stocks of your book store" do
      expect(BookPolicy::Scope.new(user, Book).resolve).to include(book)
    end
  end
end
