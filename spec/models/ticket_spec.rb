require "rails_helper"

RSpec.describe Ticket, :type => :model do
  #SETTING MODELS
  let!(:customer)           { FactoryBot.create(:customer) }
  let!(:admin)              { FactoryBot.create(:user) }
  let!(:user)               { FactoryBot.create(:user) }
  let!(:status)             { FactoryBot.create(:status, level: 6) }
  let!(:low_priority)       { FactoryBot.create(:priority, level: 1) }
  let!(:high_priority)      { FactoryBot.create(:priority, level: 3) }
  let!(:urgent_priority)  { FactoryBot.create(:priority, level: 4) }

  let!(:ticket1)  { FactoryBot.create(:ticket, status: status, priority: low_priority) }
  let!(:ticket2)  { FactoryBot.create(:ticket, status: status, priority: high_priority) }
  let!(:ticket3)  { FactoryBot.create(:ticket, status: status, priority: high_priority) }
  let!(:ticket4)  { FactoryBot.create(:ticket, status: status, priority: urgent_priority) }
  let!(:ticket5)  { FactoryBot.create(:ticket, status: status, priority: urgent_priority) }
  let!(:ticket6)  { FactoryBot.create(:ticket, status: status, priority: urgent_priority) }
  let!(:ticket7)  { FactoryBot.create(:ticket, status: status, priority: urgent_priority) }
  let!(:comment1) { FactoryBot.create(:comment, ticket: ticket1) }
  let!(:comment2) { FactoryBot.create(:comment, ticket: ticket1) }
  let!(:comment3) { FactoryBot.create(:comment, ticket: ticket1) }

  context "Relationships" do
    it { is_expected.to belong_to :admin }
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :priority }
    it { is_expected.to belong_to :status }
    it { is_expected.to have_many :comments }

    it "has comments" do
      expect(ticket1.comments.count).to eq(3)
    end
  end

  context "Validations" do
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :admin }
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :priority }
    it { is_expected.to validate_presence_of :status }
    it { is_expected.to_not validate_presence_of :comments }

    it "is not a valid ticket" do
      ticket = Ticket.new
      ticket.description = "Some description"
      expect(ticket.valid?).to be_falsy
    end
  end

  context "Scope" do
    it "is a valid urgent priority scope" do
      expect(Ticket.opened_urgent_priority.count).to eq(4)
    end

    it "is a valid high priority scope" do
      expect(Ticket.opened_high_priority.count).to eq(2)
    end

    it "is a all_opened valid scope" do
      expect(Ticket.all_opened.count).to eq(7)
    end
  end
end
