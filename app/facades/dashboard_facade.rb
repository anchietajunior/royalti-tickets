class DashboardFacade
  
  PER_PAGE = 20
  
  def initialize(params, user)
    @params = params
    @user = user
  end

  def opened_tickets
    Ticket.all_opened.page(@params[:page]).per(PER_PAGE)
  end

  def clients_number
  	Customer.all.count
  end

  def high_priority_tickets_count
    Ticket.opened_high_priority.count
  end
end
