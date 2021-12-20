class Course < ApplicationRecord
  belongs_to :coach, optional: true
  has_many :activities

  validates :name, presence: true
end
