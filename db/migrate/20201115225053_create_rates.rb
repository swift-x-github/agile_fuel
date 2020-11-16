class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.integer :rate
      t.text :ip
      t.references :experience, null: false, foreign_key: true

      t.timestamps
    end
  end
end
