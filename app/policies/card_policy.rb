class CardPolicy < ApplicationPolicy
  def index?
    record.users.include? user
  end
  def update?
    record.created_user?(user)
  end

  def destroy?
    (record.created_user?(user)) || ((user.is_a? Admin) && (record.list.created_user?(user)))
  end

  def create?
    record.users.include? user
  end
end
