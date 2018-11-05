require "rails_helper"

RSpec.describe Status, :type => :model do
  context "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :level }

    it "is not valid without name or level" do
      status = Status.new
      expect(status.valid?).to be_falsy
    end
  end

  context "relationships" do
    it { is_expected.to have_many :tickets }
  end
end
