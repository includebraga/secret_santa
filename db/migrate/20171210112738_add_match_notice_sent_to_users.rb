class AddMatchNoticeSentToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :match_notice_sent, :boolean, default: false
  end
end
