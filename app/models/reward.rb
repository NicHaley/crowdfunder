class Reward < ActiveRecord::Base
	belongs_to :project
	has_many :pledges

	validates :reward_name, :min_amount, presence: true

end
