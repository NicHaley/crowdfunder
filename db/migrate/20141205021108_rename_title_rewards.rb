class RenameTitleRewards < ActiveRecord::Migration
   def change
    rename_column :rewards, :title, :reward_title
  end
end
