require 'spec_helper'

describe BusinessData, :type => :model do
  describe 'associations' do
    it { is_expected.to have_many(:addresses) }
  end

  describe 'attributes' do
    it { is_expected.to allow_mass_assignment_of :name }
    it { is_expected.to allow_mass_assignment_of :company }
    it { is_expected.to allow_mass_assignment_of :tax_number }
    it { is_expected.to allow_mass_assignment_of :email }
    it { is_expected.to allow_mass_assignment_of :telephone }
    it { is_expected.to allow_mass_assignment_of :mobile }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :tax_number }
    it { is_expected.to validate_length_of(:tax_number).is_at_most(9) }
  end
end
