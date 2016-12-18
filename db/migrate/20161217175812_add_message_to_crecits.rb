class AddMessageToCrecits < ActiveRecord::Migration[5.0]
  def change
    add_column :crecits, :message, :text
  end
end
