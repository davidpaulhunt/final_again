require 'rails_helper'

RSpec.describe Sport, :type => :model do
  
  let(:user) { FactoryGirl.create(:user) }

  let(:position) {
    FactoryGirl.create(:position) do |position|
      user.positions.create(FactoryGirl.attributes_for(:position))
    end
  }

  let(:sport) { FactoryGirl.create(:sport) }

  it "should exist" do
    expect(sport).to be_valid
  end

  it "should be invalid without a name" do
    sport2 = Sport.create(FactoryGirl.attributes_for(:sport_no_name))
    expect(sport2).not_to be_valid
  end

  it "should be invalid if name exists" do
    sport.save
    s2 = Sport.new(FactoryGirl.attributes_for(:sport))
    s2.should_not be_valid
  end

end
