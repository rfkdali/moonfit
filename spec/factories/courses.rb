FactoryBot.define do
  factory :course do
    name { Faker::Educator.course_name }

    trait :with_coach do
      association :coach
    end
  end
end
