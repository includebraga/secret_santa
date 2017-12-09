class CreateReceivers < ActiveRecord::Migration[5.1]
  def change
    create_table :receivers do |t|
      t.string :name
      t.text :letter
      t.references :institution, foreign_key: true
      t.integer :matched_gifts, default: 0
      t.integer :received_gifts, default: 0

      t.timestamps
    end
  end
end
