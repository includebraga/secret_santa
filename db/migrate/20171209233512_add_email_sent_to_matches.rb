class AddEmailSentToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :email_sent, :boolean, default: false
  end
end
