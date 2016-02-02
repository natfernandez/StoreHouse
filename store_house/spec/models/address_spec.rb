require 'spec_helper'

describe Address, :type => :model do

  describe 'associations' do
    it { is_expected.to belong_to(:addressable) }
  end
end

