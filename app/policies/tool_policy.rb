class ToolPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    # all users can add a new tool
    true
  end

  def edit?
    # seul le propriétaire du tool peut modifier
    record.user == user
  end

  def destroy?
    # seul le propriétaire du tool peut le supprimer
    record.user == user
  end
end
