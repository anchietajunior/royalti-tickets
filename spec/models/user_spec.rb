require "rails_helper"

RSpec.describe User, :type => :model do
  context "creating new user" do
    it "is not a valid user without valid attributes" do
      user = User.new
      expect(user.valid?).to eq(false)
    end
  end
end
