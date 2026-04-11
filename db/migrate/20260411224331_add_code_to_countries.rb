class AddCodeToCountries < ActiveRecord::Migration[8.1]
  def change
    add_column :countries, :code, :string
  end
end
