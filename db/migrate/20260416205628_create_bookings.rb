class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.references :availability, null: false, foreign_key: true
      t.references :booker, null: false, foreign_key: true
      t.time :start_time
      t.integer :duration
      t.string :interview_type
      t.string :status

      t.timestamps
    end
  end
end
