class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.integer :user_id
    	t.integer :project_id
    	t.text :post
      t.timestamps
    end
  end
end
