FactoryBot.define do
  factory :project do
    project_name { 'Sample project' }
    description { 'sample description'}
    project_number { "sample-#-1234" }
    user { nil }
  end
end