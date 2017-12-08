class AddGoldenSantaToReceiver < ActiveRecord::Migration[5.1]
  def change
    add_column :receivers, :golden_santa, :boolean, default: false
  end
end
