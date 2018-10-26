class DashboardController < ApplicationController
  def index
    @dashboard_facade = DashboardFacade.new(params, current_user)
  end
end
