FactoryGirl.define do

  factory :position do
    sport_id 1
    name "quarterback"
    abbreviation "qb"

    # factory :position_with_players do
    #   ignore do
    #     players_count 5
    #   end

    #   after(:create) do |position, evaluator|
    #     create_list(:players, evaluator.players_count, player: player)
    #   end
    # end
  end

  factory :no_sport_position, class: Position, parent: :position do
    sport_id nil
  end


end