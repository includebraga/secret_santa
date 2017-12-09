class AddRedeemTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :redeem_token, :string

    add_index :users, :redeem_token, unique: true
  end
end
