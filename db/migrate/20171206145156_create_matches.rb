class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.references :user, foreign_key: true
      t.references :receiver, foreign_key: true

      t.timestamps
    end

    add_index :matches, [:user_id, :receiver_id], unique: true
  end
end
