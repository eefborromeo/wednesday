require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject(:transaction) { create(:transaction) }
  let(:user) { create(:full_access_user, money: 5000) }
  let(:asset) { create(:asset, user_id: user.id, total_shares: 10.0) }

  it "belongs to a user" do
    expect(described_class.reflect_on_association(:user).macro).to eq :belongs_to
  end

  context "upon creation" do
    it "prevents invalid attributes" do
      expect{ create(:transaction, :invalid_attr) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    describe "runs model method that" do
      it "prevents buying when insufficient balance" do
        expect{
          create(:buy_transac, 
            user_id: user.id, 
            user_email: user.email, 
            asset_name: asset.asset_name, 
            shares: 5000.0,                        
          )
        }.to raise_error(ActiveRecord::RecordNotSaved)
      end

      it "prevents selling when insufficient shares" do
        expect{
          create(:sell_transac,
            user_id: user.id, 
            user_email: user.email, 
            asset_name: asset.asset_name, 
            shares: 5000.0,  
          )
        }.to raise_error(ActiveRecord::RecordNotSaved)
      end
    end
  end

  context "after successful creation" do
    describe "runs model method that when buying" do
      before do
        create(:buy_transac,
          user_id: user.id, 
          user_email: user.email, 
          asset_name: asset.asset_name, 
          shares: 1,  
        )
      end

      it "updates asset total shares" do
        expect(Asset.find_by(asset_name: asset.asset_name)).to_not eq asset.total_shares
      end
   
      it "updates user balance" do
        expect(User.find_by(id: user.id)).to_not eq user.money
      end
    end

    describe "runs model method that when selling" do
      before do
        create(:sell_transac,
          user_id: user.id, 
          user_email: user.email, 
          asset_name: asset.asset_name, 
          shares: 1,  
        )
      end

      it "updates asset total shares" do
        expect(Asset.find_by(asset_name: asset.asset_name)).to_not eq asset.total_shares
      end

      it "updates user balance" do
        expect(User.find_by(id: user.id)).to_not eq user.money
      end
    end
  end
end
