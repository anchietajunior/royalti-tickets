require "rails_helper"

RSpec.describe Priority, :type => :model do
  context "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :level }

    it "is not a valid priority" do
      priority = Priority.new
      expect(priority.valid?).to be_falsy
    end
  end

  context "relationship" do
    it { is_expected.to have_many :tickets }
  end
end
