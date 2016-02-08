require 'spec_helper'

describe Stock, :type => :model do
  describe 'associations' do
    it { is_expected.to have_many(:prices) }
  end

  describe 'attributes' do
    it { is_expected.not_to allow_mass_assignment_of :article_id }
    it { is_expected.not_to allow_mass_assignment_of :colour_id }
    it { is_expected.not_to allow_mass_assignment_of :size_id }
    it { is_expected.to allow_mass_assignment_of :quantity }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :article_id }
    it { is_expected.to validate_presence_of :colour_id }
    it { is_expected.to validate_presence_of :size_id }
  end

  # describe 'validations uniqueness c' do
  #   it { is_expected.to validate_uniqueness_of :colour }.scoped_to(:article_id)
  # end
end
