class CreateRewards < ActiveRecord::Migration
	def change
		create_table :rewards do |t|
			t.integer :min_amount
			t.string :title
			t.integer :pledge_id
			t.integer :project_id
			t.string :description
			t.timestamps
		end
	end
end
