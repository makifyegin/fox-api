require "rails_helper"

RSpec.describe BookingMailer, type: :mailer do
  let(:booking) { create(:booking) }

  it "sends verification email" do
    email = BookingMailer.verification_email(booking)
    expect(email.to).to eq([booking.booker.email])
    expect(email.subject).to eq("Confirm your interview booking")
  end
end