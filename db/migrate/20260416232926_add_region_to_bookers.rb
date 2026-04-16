class AddRegionToBookers < ActiveRecord::Migration[8.1]
  def change
    add_reference :bookers, :region, null: true, foreign_key: true  end
end
