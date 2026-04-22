class BookingMailer < ApplicationMailer
  def verification_email(booking)
    @booking = booking
    @booker = booking.booker
    @verification_url = "http://localhost:3000/api/v1/bookings/verify?token=#{booking.verification_token}"
    mail(to: @booker.email, subject: "Confirm your interview booking")
  end
end