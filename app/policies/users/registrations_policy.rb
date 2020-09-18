class RegistrationsPolicy < ApplicaitonPolicy
  def new?
    user.admin?
  end

  def create?
    user.admin?
  end
end
