class ShowUserFacade
	def initialize(user)
		@user = user
	end

	def last_closed_tickets
		@user.owned_tickets.includes(:status).where('statuses.level = ?', 6).references(:status).last(10)
	end

	def actual_opened_tickets
		@user.owned_tickets.includes(:status).where('statuses.level = ?', 0).references(:status)
	end
end