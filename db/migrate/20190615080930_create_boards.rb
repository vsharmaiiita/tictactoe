class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
	  	# t.integer :pos_00
	  	# t.integer :pos_01
	  	# t.integer :pos_02

	  	# t.integer :pos_10
	  	# t.integer :pos_11
	  	# t.integer :pos_12

	  	# t.integer :pos_20
	  	# t.integer :pos_21
	  	# t.integer :pos_22

	  	t.integer :board_size

	  	t.timestamps
	end
  end
end
