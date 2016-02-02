require 'spec_helper'

describe Cost, :type => :model do
  describe 'associations' do
    it { is_expected.to have_many(:prices) }
  end

  describe 'attributes' do
    it { is_expected.to allow_mass_assignment_of :raw_material }
    it { is_expected.to allow_mass_assignment_of :confection }
    it { is_expected.to allow_mass_assignment_of :suplement }
    it { is_expected.to allow_mass_assignment_of :supply }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :article_id }
  end
end

