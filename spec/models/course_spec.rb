require 'rails_helper'

RSpec.describe Course, type: :model do
  describe '#name' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
