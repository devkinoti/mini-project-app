FactoryBot.define do
  factory :team_member do
    first_name { 'Jane' }
    last_name { 'Smith' }
    sequence(:email) { |n| "test#{n}@gmail.com" }
    password { 'password' }
    terms_agreement { true }
  end
end