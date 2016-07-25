require 'rails_helper'

RSpec.describe Link, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:url) }
    it { should_not allow_value("www.test.com").for(:url) }
  end

  context "associations" do
    it { should belong_to(:user) }
  end

  context "check default of read status" do
    it "should be false" do
      link_one = create(:link)
      link_two = create(:link, :read)

      expect(link_one.read).to eq("false")
      expect(link_two.read).to eq("true")
      expect(link_one.read).not_to eq(link_two.read)
    end
  end
end
