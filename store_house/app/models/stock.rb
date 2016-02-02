class Stock < ActiveRecord::Base
  # Associations
  belongs_to :article, :foreign_key => :article_id, :inverse_of => :stock
  has_many :prices, :inverse_of => :stock

  # Attributes
  attr_accessible :colour, :size, :price, :quantity

  # Validations
  validates :colour, :size, :price, :quantity, :presence => true
end

