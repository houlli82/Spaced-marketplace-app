class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

<<<<<<< HEAD
  def new?
    true
  end

  def create?
=======
  def index?
>>>>>>> master
    true
  end
end
