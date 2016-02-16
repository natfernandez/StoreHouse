require 'spec_helper'

describe OrderLineItem, :type => :model do
  describe 'associations' do
    it { is_expected.to belong_to(:order) }
  end

  describe 'attributes' do
    it { is_expected.to allow_mass_assignment_of :colour }
    it { is_expected.to allow_mass_assignment_of :size }
    it { is_expected.to allow_mass_assignment_of :price }
    it { is_expected.to allow_mass_assignment_of :quantity }
    it { is_expected.to allow_mass_assignment_of :order_id }
    it { is_expected.to allow_mass_assignment_of :article_id }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :colour }
    it { is_expected.to validate_presence_of :size }
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_presence_of :quantity }
  end
end

