class CreateBookers < ActiveRecord::Migration[8.1]
  def change
    create_table :bookers do |t|
      t.string :name
      t.string :email
      t.string :booker_type

      t.timestamps
    end
  end
end
