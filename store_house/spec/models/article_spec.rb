require 'spec_helper'

describe Article, :type => :model do
  describe 'associations' do
    it { is_expected.to have_many(:prices) }
  end

  describe 'attributes' do
    it { is_expected.to allow_mass_assignment_of :code }
    it { is_expected.to allow_mass_assignment_of :description }
    it { is_expected.not_to allow_mass_assignment_of :price_id }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :code }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_length_of(:code).is_at_most(4) }
    it { is_expected.to validate_length_of(:description).is_at_most(150) }
  end

  describe 'validations uniqueness code' do
    subject { Article.new(description: "Here is the content") }
    it { is_expected.to validate_uniqueness_of :code }
  end
end

