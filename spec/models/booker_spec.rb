require 'rails_helper'

RSpec.describe Booker, type: :model do

  let(:booker) { build(:booker, booker_type: "member", region: nil) }
  it "valid with all fields" do
    expect(booker).to be_valid
  end

  it "is not valid without name" do
    booker.name = nil
    expect(booker).to_not be_valid
  end

  it "is not valid without email" do
    booker.email = nil
    expect(booker).to_not be_valid
  end
  it "is not valid without booker_type" do
    booker.booker_type = nil
    expect(booker).to_not be_valid
  end

  it "is not valid with duplicate email" do
    region = create(:region)
    Booker.create!(name: "Other", email: "john@servas.dev", booker_type: "applicant", region: region)
    expect(booker).not_to be_valid
  end

  it "is not valid with invalid booker_type" do
    booker.booker_type = "visitor"
    expect(booker).not_to be_valid
  end

  it "is not valid without region when applicant" do
    booker.booker_type = "applicant"
    booker.region = nil
    expect(booker).not_to be_valid
  end

  it "is valid without region when member" do
    booker.booker_type = "member"
    booker.region = nil
    expect(booker).to be_valid
  end

  # pending "add some examples to (or delete) #{__FILE__}"
end
