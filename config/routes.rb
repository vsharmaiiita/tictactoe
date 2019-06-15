Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


	post '/players', to: 'players#create'

	post '/boards', to: 'boards#create'

	post '/player_boards', to: 'player_boards#update'


end
