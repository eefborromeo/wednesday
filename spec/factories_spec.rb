require "rails_helper"

EXCLUDED = [:invalid_asset, :numerical_asset]

FactoryBot.factories.map(&:name).each do |factory_name|
  describe "the #{factory_name} factory" do
    next if EXCLUDED.include?(factory_name)
  
    it "is valid" do
      expect(build factory_name).to be_valid
    end
  end
end