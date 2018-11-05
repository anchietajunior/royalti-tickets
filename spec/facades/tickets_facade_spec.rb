require 'rails_helper'

RSpec.describe TicketsFacade do
	let!(:customer1) { FactoryBot.create(:customer) }
	let!(:customer2) { FactoryBot.create(:customer) }
	let!(:customer3) { FactoryBot.create(:customer) }

	let!(:user)			{ FactoryBot.create(:user) }
	let!(:customer)	{ FactoryBot.create(:customer) }
	let!(:priority)	{ FactoryBot.create(:priority) }
	let!(:status)	{ FactoryBot.create(:status) }

	let!(:ticket1) 	{ FactoryBot.create(:ticket, priority: priority) }
	let!(:ticket2) 	{ FactoryBot.create(:ticket) }
	let!(:ticket3) 	{ FactoryBot.create(:ticket, customer: customer) }
	let!(:ticket4) 	{ FactoryBot.create(:ticket, customer: customer) }
	let!(:ticket5) 	{ FactoryBot.create(:ticket) }
	let!(:ticket6) 	{ FactoryBot.create(:ticket, user: user) }
	let!(:ticket7) 	{ FactoryBot.create(:ticket, user: user) }
	let!(:ticket8) 	{ FactoryBot.create(:ticket, priority: priority) }
	let!(:ticket9) 	{ FactoryBot.create(:ticket, priority: priority) }
	let!(:ticket10) 	{ FactoryBot.create(:ticket, priority: priority) }
	let!(:ticket11) 	{ FactoryBot.create(:ticket, priority: priority) }
	let!(:ticket12) 	{ FactoryBot.create(:ticket, status: status) }

	let!(:tickets_facade) { TicketsFacade.new({}) }
	let!(:tickets_facade_by_user) { TicketsFacade.new({ user_id: user.id }) }
	let!(:tickets_facade_by_customer) { TicketsFacade.new({ customer_id: customer.id }) }
	let!(:tickets_facade_by_status) { TicketsFacade.new({ status_id: status.id }) }
	let!(:tickets_facade_by_priority) { TicketsFacade.new({ priority_id: priority.id }) }

	context "initializing" do
		it "has tickets" do
			expect(tickets_facade.tickets.count).to eq(12)
		end

		it "has tickets by user" do
			expect(tickets_facade_by_user.tickets.count).to eq(2)
		end

		it "has tickets by customer" do
			expect(tickets_facade_by_user.tickets.count).to eq(2)
		end

		it "has tickets by status" do
			expect(tickets_facade_by_status.tickets.count).to eq(1)
		end

		it "has tickets by priority" do
			expect(tickets_facade_by_priority.tickets.count).to eq(5)
		end
	end
end