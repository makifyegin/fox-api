require 'rails_helper'

RSpec.describe Booker, type: :model do

  let(:booker) { Booker.new(name: "Akif", email: "test@servas.dev", booker_type: "member") }
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
    Booker.create!(name: "Other", email: "test@servas.dev", booker_type: "applicant")
    expect(booker).not_to be_valid
  end

  it "is not valid with invalid booker_type" do
    booker.booker_type = "visitor"
    expect(booker).not_to be_valid
  end

  # pending "add some examples to (or delete) #{__FILE__}"
end
