require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { should_not allow_value("test@test").for(:email) }
  end

  context "associations" do
    it { should have_many(:links) }
  end
end
