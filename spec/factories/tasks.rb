FactoryBot.define do
  factory :task do
    user
    sequence(:project){"Project #"}
    sequence(:title) {"Task #" }
    description { Faker::Lorem.paragraph }
    deadline_at {2.days.since}
  end
end
