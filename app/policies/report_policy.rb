class ReportPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: user)
    end
  end

  def create?
    true
  end

  def destroy?
    true
  end

  def show?
    true
  end
end
