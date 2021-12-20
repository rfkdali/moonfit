class CourseResource < JSONAPI::Resource
  attributes :name, :self_assignable
  has_many :activities
  has_one :coach

  filter :self_assignable
end
