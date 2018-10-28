class UpdateMatchesToBeInstant < ActiveRecord::Migration[5.2]
  def change
    remove_column :matches, :email_sent, :boolean
    add_column :matches, :code, :string

    remove_column :receivers, :matched_gifts, :integer
    remove_column :receivers, :received_gifts, :integer

    remove_column :users, :redeem_token, :string
    remove_column :users, :match_notice_sent, :boolean
  end
end
