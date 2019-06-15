class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
	    create_table :players do |t|
	      t.string :email
	      t.text :description
	 	  
	      t.timestamps
	  	end
  end
end
