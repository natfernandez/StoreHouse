require 'spec_helper'

describe Price, :type => :model do
  describe 'associations' do
    it { is_expected.to belong_to(:priceable) }
  end

  describe 'attributes' do
    it { is_expected.to allow_mass_assignment_of :date_from }
    it { is_expected.to allow_mass_assignment_of :date_to }
    it { is_expected.to allow_mass_assignment_of :amount }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :priceable }
    it { is_expected.to validate_presence_of :date_from }
    it { is_expected.to validate_presence_of :amount }
  end
end
