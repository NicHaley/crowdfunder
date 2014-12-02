class CreateProjects < ActiveRecord::Migration
	def change
		create_table :projects do |t|
			t.string :name
			t.text :description
			t.integer :amount
			t.string :tagline
			t.string :photo
			t.datetime :end_date
			t.datetime :start_date
			t.integer :owner_id
			t.timestamps
		end
	end
end
