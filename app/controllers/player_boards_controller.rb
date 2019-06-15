class PlayerBoardsController < ApplicationController


	def update

		board = Board.find(params[:board_id])

		position = params[:position].to_i

		# x, y = board.count
		# diff = x - y

		# if(diff > 1 || diff < 0)
		# 	render json: {error: "Board is in bad state"}.to_json, status: :unprocessable_entity and return
  #       end

  #       if(board.send("pos_#{position/3}#{position%3}") != nil)
		# 	render json: {error: "Position already filled"}.to_json, status: :unprocessable_entity and return
  #       end

        # position = 
		# board.position.update("pos_#{position/3}#{position%3}": params[:symbol])

		pos = Position.find_by(board_id: params[:board_id], x_index: position/board.board_size, 
			y_index: position%board.board_size)

		pos.symbol = params[:symbol]

		pos.save

		is_done = board.status

		if is_done == 1 || is_done == 2
			render json: "Player #{is_done} has won", status: :ok
		elsif is_done == 3
			render json: "there is a tie", status: :ok
		else
			render json: board, status: :ok
		end
	end


end