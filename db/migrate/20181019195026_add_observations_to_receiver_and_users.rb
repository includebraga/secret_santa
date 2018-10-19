class AddObservationsToReceiverAndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :receivers, :observations, :text
    add_column :users, :observations, :text
  end
end
