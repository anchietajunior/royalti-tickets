class DashboardFacade
  def initialize(user)
    @user = user
  end

  def opened_tickets
    Ticket.all
  end
end
