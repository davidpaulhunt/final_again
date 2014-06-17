FactoryGirl.define do

  factory :sport do
    name "football"
  end

  factory :sport_no_name, class: Sport do
  end

end