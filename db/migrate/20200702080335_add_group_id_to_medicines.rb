class AddGroupIdToMedicines < ActiveRecord::Migration[6.0]
  def change
    add_reference :medicines, :group, null: false, foreign_key: true
  end
end
