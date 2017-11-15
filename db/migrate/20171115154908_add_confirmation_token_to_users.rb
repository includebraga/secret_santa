class AddConfirmationTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :confirmation_token, :string
    add_index :users, :confirmation_token, unique: true
  end
end
