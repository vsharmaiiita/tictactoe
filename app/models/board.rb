class Board < ApplicationRecord

	CROSS = 1

	CIRCLE = 2

	has_many :positions

	attr_accessor :x_y_positions


	# attr_accessor: :positions

	def initialize_x_y_positions
		ret = {}
		for pos in self.positions do 
			if(ret[pos.x_index] == nil)
				ret[pos.x_index] = {}
			end
			ret[pos.x_index][pos.y_index] = pos.symbol
		end
		@x_y_positions = ret
	end


	def status
		initialize_x_y_positions()
		if is_done(CROSS)
			return 1
		elsif is_done(CIRCLE)
			return 2
		elsif is_completed()
			return 3
		else
			return 4
		end
	end

	def is_completed()
		for a in 0..board_size-1 do
			for b in 0..board_size-1 do
				if(@x_y_positions[a][b] == 0)
					return false
				end
			end
		end
		return true
	end

	def is_done(symbol)
		return is_horizontal_done(symbol) || 
			   is_vertical_done(symbol) || 
			   is_diagonal_done(symbol) || 
			   is_other_diagonal_done(symbol)
	end

	def is_horizontal_done(symbol)
		for a in 0..board_size-1 do
			count = 0
			for b in 0..board_size-1 do
				if(@x_y_positions[a][b] == symbol)
					count = count + 1
				end
			end
			if(count == board_size)
				return true
			end
		end
		return false
	end

	def is_vertical_done(symbol)
		for a in 0..board_size-1 do
			count = 0
			for b in 0..board_size-1 do
				if(@x_y_positions[b][a] == symbol)
					count = count + 1
				end
			end
			if(count == board_size)
				return true
			end
		end
		return false
	end

	def is_diagonal_done(symbol)
		count = 0
		for a in 0..board_size-1 do
				if(@x_y_positions[a][a] == symbol)
					count = count + 1
				end
		end
		if count == board_size
			return true
		else
			return false
		end
	end

	def is_other_diagonal_done(symbol)
		count = 0
		for a in 0..board_size-1 do
				if(positions[board_size-1-a][a] == symbol)
					count = count + 1
				end
		end
		if count == board_size
			return true
		else
			return false
		end
	end

	def create(board_size)

		for i in (0..board_size) do
			for j in (0..board_size) do
				Position.create(board_id: self.id, x_index: i, y_index: j, symbol: 0)
			end
		end
	end

	# def count(int m)
	# 	countx = 0
	# 	counto = 0
	# 	for a in 0..m do
	# 		for b in 0..m do
	# 			if(self.send("pos_#{a}#{b}") == 1)
	# 				p "Reached x"
	# 				countx = countx + 1
	# 			elsif(self.send("pos_#{a}#{b}") == 2)
	# 				counto = counto + 1
	# 				p "Reached o"
	# 			else
	# 			end
	# 		end
	# 	end
	# 	return countx, counto
	# end

end
