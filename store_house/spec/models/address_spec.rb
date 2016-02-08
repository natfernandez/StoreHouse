require 'spec_helper'

describe Address, :type => :model do
  describe 'associations' do
    it { is_expected.to belong_to(:addressable) }
  end

  describe 'attributes' do
    it { is_expected.to allow_mass_assignment_of :line_1 }
    it { is_expected.to allow_mass_assignment_of :line_2 }
    it { is_expected.to allow_mass_assignment_of :line_3 }
    it { is_expected.to allow_mass_assignment_of :post_code }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :addressable }
    it { is_expected.to validate_length_of(:line_1).is_at_most(50) }
    it { is_expected.to validate_length_of(:line_2).is_at_most(50) }
    it { is_expected.to validate_length_of(:line_3).is_at_most(50) }
    it { is_expected.to validate_length_of(:line_4).is_at_most(50) }
    it { is_expected.to validate_length_of(:post_code).is_at_most(5) }
    it { is_expected.to validate_length_of(:country).is_at_most(80) }
  end

  describe 'initialization' do
    describe 'set_default_country' do
      it 'returns the default country' do
        expect(subject.country).to eql("España")
      end
    end
  end
end
