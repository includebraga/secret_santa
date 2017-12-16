class AddReceivedToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :received, :boolean, default: false
  end
end
