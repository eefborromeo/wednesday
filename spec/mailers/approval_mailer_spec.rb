require "rails_helper"

RSpec.describe ApprovalMailer, type: :mailer do
  describe "trader_approved" do
    let(:user) { build(:full_access_user) }
    let(:mail) { ApprovalMailer.trader_approved(user) }

    it "renders the headers" do
      expect(mail.subject).to eq "Trader approval"
      expect(mail.to[0]).to eq user.email
      expect(mail.from[0]).to eq "wednesday.trading.rails@gmail.com"
    end

    it "renders the body" do
      expect(mail.body.encoded).to match "Thank you again for joining the Wednesday community! Our admins have approved your account." 
    end
  end

end
