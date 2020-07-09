class AddStatusToMedicine < ActiveRecord::Migration[6.0]
  def change
    add_column :medicines, :status, :boolean, default: false
  end
end
