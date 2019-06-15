class CreatePlayerBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :player_boards do |t|
	  	t.integer :player1_id
	  	t.integer :player2_id

	  	t.integer :board_id

	  	t.integer :status

	  	t.timestamps
	end
  end
end
