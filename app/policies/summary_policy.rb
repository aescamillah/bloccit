class SummaryPolicy < ApplicationPolicy

  def create?
    user.present? #&& (user.admin? || user.moderator?)
  end

  def update?
    create?
  end

  def show?
    true
  end

end
