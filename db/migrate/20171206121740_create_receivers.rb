class CreateReceivers < ActiveRecord::Migration[5.1]
  def change
    create_table :receivers do |t|
      t.string :name
      t.text :letter
      t.references :instituition, foreign_key: true
      t.integer :matched_gifts
      t.integer :received_gifts

      t.timestamps
    end
  end
end
