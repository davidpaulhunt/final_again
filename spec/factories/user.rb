FactoryGirl.define do

  factory :user, class: Player do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email Faker::Internet.email
    password "password"
    password_confirmation "password"
    birthday Date.today - 17.years
    terms "1"
    type "Player"
  end

  factory :updated_user, parent: :user do
    first_name "John"
  end

  factory :no_email_user, class: User do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    password "password"
    password_confirmation "password"
    birthday Date.today - 17.years
  end

  factory :wrong_confirm_password, class: User, parent: :user do
    password_confirmation "wrong"
  end

  factory :not_accept_terms, class: User, parent: :user do
    terms "0"
  end

end