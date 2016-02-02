class Customer < ActiveRecord::Base
  # Associations
  has_many :addresses, :as => :addressable

  # Attributes
  attr_accessible :name, :company, :tax_number, :re_income, :email, :telephone, :mobile, :contact_person, :notes

  # Validations
  validates :name, :tax_number, :presence => true
  validates :tax_number, :length => { :maximum => 9 }
end
