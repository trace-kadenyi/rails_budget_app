class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all, Category do |category|
      category.user == user
    end

    can :manage, :all, Expenditure do |expense|
      expense.user == user
    end
  end
end
