class Message < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :crecit, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
