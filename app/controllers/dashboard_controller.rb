class DashboardController < ApplicationController
  def home
    @dashboard_facade = DashboardFacade.new(current_user)
  end
end
