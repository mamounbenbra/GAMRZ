class ChatroomPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def show?
    record.matches.find {|match| match.from_user == user || match.to_user == user }.present?
  end

  def destroy?
    record.matches.find {|match| match.from_user == user || match.to_user == user }.present?
  end

end
