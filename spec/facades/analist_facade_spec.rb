require 'rails_helper'

RSpec.describe AnalistFacade do
	let!(:user) 		{ FactoryBot.create(:user) }
	let!(:ticket1) 	{ FactoryBot.create(:ticket, user: user) }
	let!(:ticket2) 	{ FactoryBot.create(:ticket, user: user) }
	let!(:ticket3) 	{ FactoryBot.create(:ticket, user: user) }
	let!(:ticket4) 	{ FactoryBot.create(:ticket, user: user) }
	let!(:ticket5) 	{ FactoryBot.create(:ticket, user: user) }
	let!(:ticket6) 	{ FactoryBot.create(:ticket, user: user) }
	let!(:ticket7) 	{ FactoryBot.create(:ticket, user: user) }
	let!(:analist_facade)  { AnalistFacade.new({ analist_id: user.id }) }

	context "initializing" do
		it "has tickets" do
			expect(analist_facade.tickets.count).to eq(7)
		end
		
		it "has a analist" do
			expect(analist_facade.analist.present?).to be_truthy
		end
	end
end