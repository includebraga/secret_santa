class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :key, null: false, index: { unique: true }
      t.string :value, null: false
    end
  end
end
