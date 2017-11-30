class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: true
  validates :description, length: { in: 20..500 }

  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: self.supplier_id)
  # end
  has_many :orders
  has_many :images
  # def image
  #   Image.where(id: self.image.id)
  # end

  def is_discounted
     price.to_f <= 2
  end

  def tax 
    price.to_f * 0.09 
  end

  def total 
    price.to_f + tax
  end

  def as_json
   {
    id: id,
    name: name,
    price: price.to_i,
    images: images.as_json,
    description: description,
    is_discounted: is_discounted,
    tax: tax,
    total: total,
    supplier: supplier.as_json
  }
  end
end
