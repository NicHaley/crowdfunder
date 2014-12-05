class Project < ActiveRecord::Base
	belongs_to :owner, class_name: "User"
	has_many :rewards
	has_many :pledges, through: :rewards
	has_many :comments

	validates :start_date, :end_date, :name, :amount, presence: true
	validate :project_date?, :end_greater_than_start?
	validates_associated :rewards

	accepts_nested_attributes_for :rewards, :allow_destroy => true

	def project_date?
		if end_date < Date.today && start_date < Date.today
			errors.add(:end_date, "can't be in the past")
			errors.add(:start_date, "can't be in the past")
		end
	end

	def end_greater_than_start?
		if end_date < start_date
			errors.add(:end_date, "can't be less than start")
		end
	end
end
