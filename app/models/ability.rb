class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)
    
    alias_action :create, :read, :update, :delete, to: :crud
    alias_action :read, :update, to: :ru
    alias_action :create, :read, :update, to: :cru

    if user.role == "admin"
      can :manage, Studentsubject
      can :manage, User
      can :manage, Student
      can :manage, Account
      can :manage, Debt
      can :manage, Group
      can :manage, Semester
      can :manage, Subject
      can :manage, Recordpayment
    elsif user.role == "professor"
      can :ru, Studentsubject
      cannot :manage, User
      cannot :manage, Student
      cannot :manage, Account
      cannot :manage, Debt
      cannot :manage, Group
      cannot :manage, Semester
      cannot :manage, Subject
      cannot :manage, Recordpayment
    elsif user.role == "control"
      can :manage, Student
      can :update, Account
    elsif !user.present?
      can :read, Main
    end
   

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
