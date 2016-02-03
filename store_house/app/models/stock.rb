class Stock < ActiveRecord::Base
  # Associations
  has_many :prices, :as => :priceable
  belongs_to :article, :foreign_key => :article_id, :inverse_of => :stock

  # Attributes
  attr_accessible :colour, :size, :quantity

  # Validations
  validates :colour, :size, :quantity, :presence => true
  validates :colour, :uniqueness => { :scope => :article_id }
end

