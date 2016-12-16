class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :rooms
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
