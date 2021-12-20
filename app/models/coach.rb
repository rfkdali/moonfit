class Coach < ApplicationRecord
  has_many :courses
  before_destroy :assign_coach

  validates :name, presence: true

  scope :available_coach, ->(coach_id) { where.not(id: coach_id).pick(:id) }

  private

  def assign_coach
    Course.where(coach_id: id).update_all(coach_id: Coach.available_coach(id))
  end
end
