class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    update?
  end

  def update?
    @user.try(:has_role?, :teacher) || @record.user == @user
  end

  def new?
    create?
  end

  def create?
    @user.has_role?(:teacher)
  end

  def destroy?
    @user.has_role?(:teacher) || @record.user == @user
  end
end
