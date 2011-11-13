require 'spec_helper'

describe Product do
  it "is valid with valid attributes" do
    Product.new.should be_valid
  end

  it "is not valid w/o a name" do
    product = Product.new( name: nil)
    product.should_not be_valid
  end
end
