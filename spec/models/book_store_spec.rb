require 'rails_helper'

RSpec.describe BookStore, type: :model do
  subject { create(:book_store) }

  it { should validate_presence_of(:name) }
  it { should have_many(:books) }
  it { should have_many(:users) }

  describe "#remove_foreign_key_from_users" do
    let(:user) { create(:user) }

    it "removes user's book_store_id when deleted" do
      user.book_store.destroy
      user.reload

      expect(user.book_store_id).to eq(nil)
    end
  end
end
