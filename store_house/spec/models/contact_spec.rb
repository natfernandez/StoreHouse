require 'spec_helper'

describe Contact, :type => :model do
  describe 'associations' do
    it { is_expected.to have_many(:addresses) }
  end

  describe 'attributes' do
    it { is_expected.to allow_mass_assignment_of :name }
    it { is_expected.to allow_mass_assignment_of :company }
    it { is_expected.to allow_mass_assignment_of :tax_number }
    it { is_expected.to allow_mass_assignment_of :re_income }
    it { is_expected.to allow_mass_assignment_of :email }
    it { is_expected.to allow_mass_assignment_of :telephone }
    it { is_expected.to allow_mass_assignment_of :mobile }
    it { is_expected.to allow_mass_assignment_of :contact_person }
    it { is_expected.to allow_mass_assignment_of :notes }
    it { is_expected.to allow_mass_assignment_of :notes }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :tax_number }
    it { is_expected.to validate_length_of(:tax_number).is_at_most(9) }
  end

  describe 'initialization' do
    describe 'set_defaults' do
      it 'should initialize discount to 0.0' do
        expect(subject.re_income).to eql(false)
      end
    end
  end
end
