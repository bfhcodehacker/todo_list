class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string  :name      
      t.text    :description
      t.date    :due
      t.integer :user_id
      t.timestamps
    end
    
    add_index :things, :user_id
  end
end
