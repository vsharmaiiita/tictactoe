class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|

      t.integer :board_id
      t.integer :x_index
      t.integer :y_index
      t.integer :symbol

      t.timestamps
    end
  end
end
