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
    # only if the user creating the booking is not the owner of the tool being booked
    user != record.tool.user
  end

  def show?
    # only for user who is booking or for the owner of the tool being booked
    (user == record.user) || (user == record.tool.user)
  end

  def edit?
    update?
  end

  def update?
    show?
  end

  def accept?
    # owner can accept if booking is pending only
    (user == record.tool.user) && (record.status == 'pending')
  end

  def decline?
    accept?
  end

  def cancel?
    # user can cancel if booking is pending or validated
    (user == record.user) && ((record.status == 'pending') || (record.status == 'validated'))
  end
end
