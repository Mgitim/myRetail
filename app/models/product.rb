class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  field :product_id, type: Integer
  field :name, type: String
  validates_presence_of :product_id
  validates_presence_of :name
end
