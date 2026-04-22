class AddVerificationTokenToBookings < ActiveRecord::Migration[8.1]
  def change
    add_column :bookings, :verification_token, :string
  end
end
