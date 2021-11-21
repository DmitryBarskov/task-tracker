FactoryBot.define do
  factory :task do
    project
    sequence(:title) { |n| "Task ##{n}" }
    description { Faker::Lorem.paragraph }
    sequence(:deadline_at) { Time.now }
  end
end

