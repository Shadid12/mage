class AddCustomFieldsToCrecits < ActiveRecord::Migration[5.0]
  def change
    remove_column :crecits, :message, :text
    remove_column :crecits, :user_id, :integer
    add_column :crecits, :cleaner_id, :integer
    add_column :crecits, :host_id, :integer
  end
end
