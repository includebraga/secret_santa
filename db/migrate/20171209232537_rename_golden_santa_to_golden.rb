class RenameGoldenSantaToGolden < ActiveRecord::Migration[5.1]
  def change
    rename_column :receivers, :golden_santa, :golden
  end
end
