class Product < ActiveRecord::Base
  #attr_accessible
  
  validates_presence_of :name
  validates_length_of   :name, maximum: 120
end
