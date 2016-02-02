class Article < ActiveRecord::Base

  # Associations
  has_many :prices, :as => :priceable

  # Attributes
  attr_accessible :code, :description

  # Validations
  validates :code, :description, :presence => true
  validates :code, :length => { :maximum => 4 }
  validates :description, :length => { :maximum => 150 }
end

