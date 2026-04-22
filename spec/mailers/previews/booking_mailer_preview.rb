# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer_mailer
class BookingMailerPreview < ActionMailer::Preview
  def verification_email
    booking = Booking.last
    BookingMailer.verification_email(booking)
  end
end
