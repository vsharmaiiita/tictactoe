class BoardsController < ApplicationController

	def create

		board = Board.create(board_size: params[:board_size])
		board.create(params[:board_size].to_i - 1)
		player_board = PlayerBoard.new(player1_id: params[:player1_id],
									   player2_id: params[:player2_id],
									   board_id: board.id,
									   status: 1
										)
		player_board.save
		render json: player_board

	end
end