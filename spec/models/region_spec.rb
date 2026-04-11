require "rails_helper"

RSpec.describe Region, type: :model do
  let(:country) { Country.create!(name: "United Kingdom", code: "GB") }


  it "is valid with a name and country" do
    region = Region.new(name: "London", country: country)
    expect(region).to be_valid
  end

  it "is not valid without a name" do
    region = Region.new(name: nil, country: country)
    expect(region).not_to be_valid
  end

  it "is not valid without a country" do
    region = Region.new(name: "London", country: nil)
    expect(region).not_to be_valid
  end
end