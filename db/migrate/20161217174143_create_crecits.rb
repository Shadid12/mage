class CreateCrecits < ActiveRecord::Migration[5.0]
  def change
    create_table :crecits do |t|
      t.integer :listing_id
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
