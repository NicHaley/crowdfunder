class Ability
  include CanCan::Ability

  # def initialize(user)

  #   user ||= User.new
  #   can :edit, Project, :owner_id => user.id
  # end
end
