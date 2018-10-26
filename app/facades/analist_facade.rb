class AnalistFacade

  PER_PAGE = 20

  def initialize(params)
    @params = params
    @analist = User.find(params[:analist_id])
  end

  def analist
    @analist
  end

  def tickets
    Ticket.includes(:status).includes(:priority).where(user_id: @analist.id).page(@params[:page]).per(PER_PAGE)
  end
end
