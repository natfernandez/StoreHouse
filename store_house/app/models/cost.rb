class Cost < ActiveRecord::Base
  # Associations
  has_many :prices, :as => :priceable

  # Attributes
  attr_accessible :raw_material, :confection, :suplement, :supply

  # Validations
  validates :article_id, :presence => true
end
