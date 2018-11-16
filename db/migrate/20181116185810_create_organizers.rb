class CreateOrganizers < ActiveRecord::Migration[5.2]
  def change
    create_table :organizers do |t|
      t.string :email
      t.string :uuid
    end

    add_index :organizers, :email, unique: true
    add_index :organizers, :uuid, unique: true
  end
end
