class RegistrationsPolicy < ApplicaitonPolicy
  def new?
    user.admin? or !record.published?
  end

  def create?
    user.admin? or !record.published?
  end
end
