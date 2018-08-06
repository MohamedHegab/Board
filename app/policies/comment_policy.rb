class CommentPolicy < ApplicationPolicy
  def create?
    (user.is_a? Admin) || (record.card.list.users.include? user )
  end

  def update?
    (record.created_user?(user)) || ((user.is_a? Admin) && (record.card.list.created_user?(user)))
  end

  def delete?
    (record.created_user?(user)) || ((user.is_a? Admin) && (record.card.list.created_user?(user)))
  end
end
