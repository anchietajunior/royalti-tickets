class TicketsFacade

  PER_PAGE = 20

  def initialize(params)
    @params = params
  end

  def tickets
    if @params[:customer_id].present?
      tickets_by_customer
    elsif @params[:status_id].present?
      tickets_by_status    
    elsif @params[:priority_id].present?
      tickets_by_priority    
    elsif @params[:user_id].present?
      tickets_by_user
    else
      all_tickets
    end
  end

  def all_customers
    Customer.all
  end

  def all_status
    Status.all
  end

  def all_priorities
    Priority.all
  end

  def all_users
    User.all
  end

  private

  def all_tickets
    Ticket.includes(:status).includes(:customer).includes(:priority).includes(:user).all.order('created_at').page(@params[:page]).per(PER_PAGE)
  end

  def tickets_by_customer
    Customer.find(@params[:customer_id]).tickets.includes(:customer).includes(:priority).includes(:user).order('created_at').page(@params[:page]).per(PER_PAGE)
  end

  def tickets_by_status
    Status.find(@params[:status_id]).tickets.includes(:customer).includes(:priority).includes(:user).order('created_at').page(@params[:page]).per(PER_PAGE)
  end

  def tickets_by_priority
    Priority.find(@params[:priority_id]).tickets.includes(:customer).includes(:priority).includes(:user).order('created_at').page(@params[:page]).per(PER_PAGE)
  end

  def tickets_by_user
    User.find(@params[:user_id]).owned_tickets.includes(:customer).includes(:priority).includes(:user).order('created_at').page(@params[:page]).per(PER_PAGE)
  end
end
