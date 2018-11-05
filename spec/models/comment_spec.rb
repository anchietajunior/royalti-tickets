require "rails_helper"

RSpec.describe Comment, :type => :model do
	context "validations" do
    it { is_expected.to validate_presence_of :text }
    it { is_expected.to validate_presence_of :ticket }
    it { is_expected.to validate_presence_of :user }

    it "is not a valid comment" do
      comment = Comment.new
      expect(comment.valid?).to be_falsy
    end
  end

  context "relationship" do
    it { is_expected.to belong_to :ticket }
    it { is_expected.to belong_to :user }
  end
end
