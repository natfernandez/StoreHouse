require 'spec_helper'

describe Stock, :type => :model do
  describe 'associations' do
    it { is_expected.to have_many(:prices) }
  end

  describe 'attributes' do
    it { is_expected.to allow_mass_assignment_of :colour }
    it { is_expected.to allow_mass_assignment_of :size }
    it { is_expected.to allow_mass_assignment_of :quantity }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :colour }
    it { is_expected.to validate_presence_of :size }
  end

  describe 'validations uniqueness c' do
    it { is_expected.to validate_uniqueness_of :colour }.scoped_to(:article_id)
  end
end
