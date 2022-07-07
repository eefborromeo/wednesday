require "rails_helper"

RSpec.describe ApprovalMailer, type: :mailer do
  describe "trader_approved" do
    let(:user) { build(:full_access_user) }
    let(:mail) { ApprovalMailer.trader_approved(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Trader approval")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["wednesday@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Greetings")
    end
  end

end
