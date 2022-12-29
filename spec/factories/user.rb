# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Smith' }
    sequence(:email) { |n| "test#{n}@gmail.com" }
    password { 'password' }
    terms_agreement { true }
  end
end
