class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
    change_column :things, :due, :string
  end
end
