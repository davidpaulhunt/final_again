require 'rails_helper'

RSpec.describe Position, :type => :model do
  
  let(:user) { FactoryGirl.create(:user) }

  let(:position) {
    FactoryGirl.create(:position) do |position|
      user.positions.create(FactoryGirl.attributes_for(:position))
    end
  }

  let(:sport) { Sport.create(FactoryGirl.attributes_for(:sport)) }

  it "should exist" do
    expect(position).to be_valid
  end

  it "should be invalid without a sports id" do
    position2 = Position.create(FactoryGirl.attributes_for(:no_sport_position))
    expect(position2).not_to be_valid
  end

  it "should have players" do
    position.players << user
    expect(position.players.count).to be(1)
  end

  it "should have a sport" do
    position.sport_id = sport.id
    position.save
    expect(position.sport).to eq(sport)
  end

end