class AddGenderAndAgeToReceivers < ActiveRecord::Migration[5.1]
  def change
    add_column :receivers, :gender, :integer, default: 0
    add_column :receivers, :age, :integer
  end
end
