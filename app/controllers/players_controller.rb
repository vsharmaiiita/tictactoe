class PlayersController < ApplicationController

	def create

		player = Player.find_by(email: params[:email])
		if(player.nil?)
			player = Player.new(email: params[:email])
			player.save
			player.reload
		end
		render json: player.id
	end
end
