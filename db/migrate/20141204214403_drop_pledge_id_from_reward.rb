class DropPledgeIdFromReward < ActiveRecord::Migration
  def change
  	remove_column :rewards, :pledge_id
  	add_column :pledges, :reward_id, :integer
  end
end
