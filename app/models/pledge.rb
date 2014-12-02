class Pledge < ActiveRecord::Base
	belongs_to :user
	has_one :reward
end
