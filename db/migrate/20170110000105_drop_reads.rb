class DropReads < ActiveRecord::Migration[5.0]
  def change
    drop_table :reads
  end
end
