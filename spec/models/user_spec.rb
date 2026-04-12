require 'rails_helper'

RSpec.describe User, type: :model do
  let(:country) { Country.create!(name: "Germany", code: "DE") }
  let(:region) { Region.create!(name: "Berlin", country: country) }
  let(:user) { User.new(
    email: "test@gmail.com",
    password: "password123",
    first_name: "John",
    last_name: "Smith",
    role: "interviewer",
    region: region
  )}

  # Valid user
  it "is valid with all fields" do
    expect(user).to be_valid
  end

  # Email validations
  it "is not valid without an email" do
    user.email = nil
    expect(user).not_to be_valid
  end

  it "is not valid with a duplicate email" do
    user.save!
    duplicate = User.new(email: "test@gmail.com", password: "pass123", first_name: "Jane", last_name: "Doe", role: "admin", region: region)
    expect(duplicate).not_to be_valid
  end

  # Name validations
  it "is not valid without a first name" do
    user.first_name = nil
    expect(user).not_to be_valid
  end

  it "is not valid without a last name" do
    user.last_name = nil
    expect(user).not_to be_valid
  end

  # Password validation
  it "is not valid without a password" do
    user.password = nil
    expect(user).not_to be_valid
  end

  # Role validations
  it "is valid with admin role" do
    user.role = "admin"
    expect(user).to be_valid
  end

  it "is valid with interviewer role" do
    user.role = "interviewer"
    expect(user).to be_valid
  end

  it "is not valid without a role" do
    user.role = nil
    expect(user).not_to be_valid
  end

  it "is not valid with an invalid role" do
    user.role = "manager"
    expect(user).not_to be_valid
  end

  # Region validation
  it "is not valid without a region" do
    user.region = nil
    expect(user).not_to be_valid
  end
end