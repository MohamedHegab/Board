class ListPolicy < ApplicationPolicy
  def index?
    (record.users.include? user)
  end
  def show?
    (record.users.include? user)
  end
  def assign_member?
    (user.is_a? Admin) && (record.created_user?(user))
  end

  def unassign_member?
    (user.is_a? Admin) && (record.created_user?(user))
  end

  def create?
    user.is_a? Admin
  end

  def update?
    (user.is_a? Admin) && (record.created_user?(user))
  end

  def destroy?
    (user.is_a? Admin) && (record.created_user?(user))
  end
end