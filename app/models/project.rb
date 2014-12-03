class Project < ActiveRecord::Base
	belongs_to :owner, class_name: "User"
	has_many :rewards
	has_many :pledges, through: :rewards
	has_many :comments

	accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true
end
