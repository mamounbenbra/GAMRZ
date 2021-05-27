class UserPolicy < ApplicationPolicy
  def edit? 
    record.id == user.id
  end
  def index? 
    return true
  end
  def show?
    if @user == record
      return true
    elsif (Match.where(from_user: record, to_user: @user, mutual: true).empty? &&  Match.where(from_user: @user, to_user: record, mutual: true).empty?)
      return false 
    else 
      return true 
    end 
  end
  def like?
    return true
  end
  def dislike?
    return true
  end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
