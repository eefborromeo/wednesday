require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:full_access_user) { create(:full_access_user) }
  let(:confirmed_user) { create(:confirmed_user) }
  let(:user) { build(:user) }

  it "has many assets" do
    expect(described_class.reflect_on_association(:assets).macro).to eq :has_many
  end

  it "has many transactions" do
    expect(described_class.reflect_on_association(:transactions).macro).to eq :has_many
  end
end
