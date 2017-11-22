class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: true
  validates :description, length: { in: 20..500 }



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
    image: image,
    description: description,
    is_discounted: is_discounted,
    tax: tax,
    total: total
  }
  end
end
