class RemoveRewardTitleAddName < ActiveRecord::Migration
  def change
  	remove_column :rewards, :reward_title
  	add_column :rewards, :reward_name, :string
  end
end
