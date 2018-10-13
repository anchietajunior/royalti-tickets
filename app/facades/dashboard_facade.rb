class DashboardFacade
  def initialize(user)
    @user = user
  end

  def opened_tickets
    Ticket.all_opened
  end

  def clients_number
  	Customer.all.count
  end
end
