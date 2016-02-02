require 'spec_helper'

describe ::Business, :type => :model do

  describe 'attributes' do
    it { is_expected.to allow_mass_assignment_of :name }
  end
  it { is_expected.to validate_presence_of :bank_account_id }

end
