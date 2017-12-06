class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :user_id
      t.integer :receiver_id

      t.timestamps
    end
    add_index :matches, [:user_id, :receiver_id]
  end
end
