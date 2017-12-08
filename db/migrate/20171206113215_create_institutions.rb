class CreateInstitutions < ActiveRecord::Migration[5.1]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :short_name

      t.timestamps
    end

    add_index :institutions, :short_name, unique: true
  end
end
