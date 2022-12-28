FactoryBot.define do
  factory :task do
    name { 'Sample project task' }
    description { 'sample description lorem ipsum'}
    start_date { DateTime.now }
    end_date { DateTime.now + 1}
    status { "Not Started" }
    account { nil }
    project { nil }
  end
end