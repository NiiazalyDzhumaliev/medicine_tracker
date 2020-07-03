class CreateUngroupedMedicines < ActiveRecord::Migration[6.0]
  def change
    create_table :ungrouped_medicines do |t|
      t.string :name
      t.integer :amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
