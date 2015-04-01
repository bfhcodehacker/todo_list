class AlterThingsAddRowOrder < ActiveRecord::Migration
  def change
    add_column :things, :row_order, :integer
    add_index  :things, :row_order
  end
end
