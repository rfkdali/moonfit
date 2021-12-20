activity_names = %w[lesson exercise challenge]

coaches = 5.times.map do
  Coach.create(name: Faker::Name.name)
end

courses = 7.times.map do
  course = Course.new(
    name: Faker::Educator.course_name,
    self_assignable: [true, false].sample,
    coach: coaches.sample)

  course.activities = activity_names.map do |activity_name|
    Activity.new(name: activity_name, course: course)
  end

  course.save
end
