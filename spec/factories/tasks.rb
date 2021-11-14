FactoryBot.define do
	factory :task do
		project
		user
		sequence(:title) { |n| "Task number #{n}" }
		description { Faker::Lorem.paragraph }
		deadline_at {1.weeks.from_now}
	end
end
