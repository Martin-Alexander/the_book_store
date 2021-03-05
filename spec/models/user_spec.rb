require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }

  it { should validate_presence_of(:email) }
  it { should belong_to(:book_store).optional }
end
