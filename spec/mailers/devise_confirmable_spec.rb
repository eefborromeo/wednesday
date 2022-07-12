require "rails_helper"

RSpec.describe Devise::Mailer, type: :mailer do
  it "sends a confirmation email to correct receiver email with custom message" do
    user = create(:user)
    confirmation_email = Devise.mailer.deliveries.last

    expect(user.email).to eq confirmation_email.to[0]
    expect(confirmation_email.body.to_s).to have_content "Thank you for joining Wednesday Trading."
  end
end