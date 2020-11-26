class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.string :name
      t.integer :raiting
      t.string :ip
      t.references :experience, null: false, foreign_key: true

      t.timestamps
    end
  end
end
