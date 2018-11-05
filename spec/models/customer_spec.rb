require 'rails_helper'

RSpec.describe Customer, :type => :model do
	context "Validations" do
		it { is_expected.to validate_presence_of :name}

    it "is not a valid customer" do
      customer = Customer.new
      expect(customer.valid?).to be_falsy
    end
	end

	context "Relationship" do
    it { is_expected.to have_many :tickets }
	end
end
