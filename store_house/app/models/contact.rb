class Contact < ActiveRecord::Base
  # Associations
  has_many :addresses, :as => :addressable
  has_many :orders, :inverse_of => :customer

  # Attributes
  attr_accessible :name, :company, :tax_number, :re_income, :email, :telephone, :mobile,
    :contact_person, :notes, :risk

  # Validations
  validates :name, :tax_number, :presence => true
  validates :tax_number, :length => { :maximum => 9 }

  after_initialize :set_defaults

  private
  def set_defaults
    self.re_income ||= false
  end
end
