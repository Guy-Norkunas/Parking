# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

      user ||= User.new 
      if user.admin?
        can :manage, :all
      else
        can [:index, :show, :new, :create], Listing
        can [:edit, :update, :destroy], Listing, user_id: user.id
        can [:create], Review, user_id: user.id
      end
    
  end
end
