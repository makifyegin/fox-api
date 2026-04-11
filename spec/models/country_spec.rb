require "rails_helper"

RSpec.describe Country, type: :model do
  it "is valid with a name and code" do
    country = Country.new(name: "United Kingdom", code: "GB")
    expect(country).to be_valid
  end

  it "is not valid without a name" do
    country = Country.new(name: nil, code: "GB")
    expect(country).not_to be_valid
  end

  it "is not valid without a code" do
    country = Country.new(name: "United Kingdom", code: nil)
    expect(country).not_to be_valid
  end

  it "is not valid with a code longer than 2 characters" do
    country = Country.new(name: "United Kingdom", code: "GBR")
    expect(country).not_to be_valid
  end

  it "does not allow duplicate codes" do
    Country.create(name: "United Kingdom", code: "GB")
    duplicate = Country.new(name: "Great Britain", code: "GB")
    expect(duplicate).not_to be_valid
  end

  it "is not valid with a fake country code" do
    country = Country.new(name: "Wakanda", code: "WK")
    expect(country).not_to be_valid
  end
end