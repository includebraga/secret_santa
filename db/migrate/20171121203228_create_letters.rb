class CreateLetters < ActiveRecord::Migration[5.1]
  def change
    create_table :letters do |t|
      t.string :name
      t.string :instituition
      t.text :observation

      t.timestamps
    end
  end
end
