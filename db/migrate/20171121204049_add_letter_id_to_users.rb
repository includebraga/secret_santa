class AddLetterIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :letter_id, :integer
    add_index  :users, :letter_id
  end
end
