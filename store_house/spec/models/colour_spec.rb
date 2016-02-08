require 'spec_helper'

describe Colour, :type => :model do
  describe 'attributes' do
    it { is_expected.to allow_mass_assignment_of :description }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :description }
  end
end
