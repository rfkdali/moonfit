class Api::V1::CoachResource < JSONAPI::Resource
  attributes :name
  has_many :courses
end
