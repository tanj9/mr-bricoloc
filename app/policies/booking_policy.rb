class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    # end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def show?
    # true (i.e. authorized) if
    # 1. user is the booking user (record.user)
    # OR
    # 2. user is the owner of the booked tool (record.tool.user)
    (user == record.tool.user) || (user == record.user)
  end

  def edit?
    update?
  end

  def update
    show?
  end
end
