require 'rails_helper'

RSpec.describe Coach, type: :model do
  describe '#name' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe '#assign_coach' do
    let(:course) { create(:course, :with_coach) }
    let!(:coach_2) { create(:coach) }
    it 'When destroyed, it assigns a new coach' do
      coach_1 = course.coach
      expect {course.coach.destroy}.to change {
        course.reload.coach
      }.from(coach_1).to(coach_2)
    end
  end
end
