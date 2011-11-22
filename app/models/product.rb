class Product < ActiveRecord::Base
  #attr_accessible

  validates  :name, presence: true, uniqueness: true, length: {maximum: 120}

end
