require 'spec_helper'

describe Size, :type => :model do
  describe 'associations' do
    it { is_expected.to belong_to(:colour) }
  end

  describe 'attributes' do
    it { is_expected.to allow_mass_assignment_of :description }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :colour_id }
    it { is_expected.to validate_presence_of :description }
  end
end
