require 'rails_helper'

RSpec.describe Asset, type: :model do
  let(:user) { create(:full_access_user) }
  subject(:asset) { create(:asset, user_id: user.id, asset_name: "goog") }
  
  it "belongs to a user" do
    expect(described_class.reflect_on_association(:user).macro).to eq :belongs_to
  end
  
  context "upon creation" do
    it "is rejected while with invalid attributes" do
      expect(build(:numerical_asset)).to_not be_valid
    end

    it "rejects invalid asset symbols" do
      expect{ create(:invalid_asset) }.to raise_error(IEX::Errors::SymbolNotFoundError)
    end

    it "upcases the asset name" do
      expect(asset.asset_name).to_not eq asset.asset_name.downcase
    end

    it "invalidates duplicates" do
      duplicate_asset = create(:asset, user_id: user.id, asset_name: "META")
      expect{ create(:asset, user_id: user.id, asset_name: "META") }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context "after successful creation with valid asset name" do
    it "gets asset info" do
      expect{ Asset.get_asset_info(asset.asset_name) }.not_to raise_error
    end

    it "gets asset historical prices" do
      expect{ Asset.get_historical_prices(asset.asset_name) }.not_to raise_error
    end

    it "gets popular asset list" do
      expect{ Asset.get_popular_assets }.not_to raise_error
    end
  end
end
