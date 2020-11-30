class AddRateToExperience < ActiveRecord::Migration[6.0]
  def change
    add_column :experiences, :rate, :decimal
  end
end
