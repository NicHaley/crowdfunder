class User < ActiveRecord::Base
	authenticates_with_sorcery!

	has_many :pledges
	has_many :projects
	has_many :comments, through: :projects
	has_many :rewards, through: :pledges

	validates :password, confirmation: true
	validates :password_confirmation, presence: true

	validates :email, uniqueness: true
end
