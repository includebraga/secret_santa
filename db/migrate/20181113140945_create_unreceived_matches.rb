class CreateUnreceivedMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :unreceived_matches do |t|
      t.references :user, foreign_key: true, null: false
      t.references :receiver, foreign_key: true, null: false
      t.string :code, null: false
      t.boolean :received, null: false
    end

    add_index :unreceived_matches, [:user_id, :receiver_id], unique: true
  end
end
