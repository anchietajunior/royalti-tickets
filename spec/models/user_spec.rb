require "rails_helper"

RSpec.describe User, :type => :model do
 
  let(:user) { FactoryBot.create(:user) }

  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
  end

  context "relationship" do
    it { is_expected.to have_many :admin_tickets }
    it { is_expected.to have_many :owned_tickets }
    it { is_expected.to have_many :comments }
  end
end
