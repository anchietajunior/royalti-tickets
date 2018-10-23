class DashboardController < ApplicationController
  def home
    @dashboard_facade = DashboardFacade.new(params, current_user)
  end
end
