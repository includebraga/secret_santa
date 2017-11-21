class AddRedeemDeliverToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :redeemed_at, :timestamp
    add_column :users, :delivered_at, :timestamp
  end
end
