require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }
  let(:user2) { create(:confirmed_user, first_name: "lance", last_name: "pallarca") }

  it "has many assets" do
    expect(described_class.reflect_on_association(:assets).macro).to eq :has_many
  end

  it "has many transactions" do
    expect(described_class.reflect_on_association(:transactions).macro).to eq :has_many
  end

  it "deletes its assets" do
    build(:asset, user_id: user.id)
    user.destroy
    expect(Asset.find_by(user_id: user.id)).to eq nil
  end

  it "deletes its transactions" do
    build(:transaction, user_id: user.id, user_email: user.email)
    user.destroy
    expect(Transaction.find_by(user_id: user.id)).to eq nil
  end

  describe "username" do
    it "invalidates null" do
      user.username = nil
      expect(user).to_not be_valid
    end

    it "invalidates duplicates" do
      user.username = user2.username
      expect(user).to_not be_valid
    end

    it "invalidates more than 15 characters" do
      user.username = "a" * 16
      expect(user).to_not be_valid
    end
  end

  describe "first and last name" do
    it "invalidates null first name" do
      user.first_name = nil
      expect(user).to_not be_valid
    end

    it "invalidates null last name" do
      user.last_name = nil
      expect(user).to_not be_valid
    end

    it "invalidates special characters and numbers for first name" do
      user.first_name = "#{user.first_name}#{1}?!"
      expect(user).to_not be_valid
    end

    it "invalidates special characters and numbers for last name" do
      user.last_name = "#{user.last_name}#{1}?!"
      expect(user).to_not be_valid
    end

    it "capitalizes the first letter of first name" do
      expect(user2.first_name).to_not eq user2.first_name.downcase
    end

    it "capitalizes the first letter of last name" do
      expect(user.last_name).to_not eq user.last_name.downcase
    end
  end
end
