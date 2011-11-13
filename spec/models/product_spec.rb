require 'spec_helper'

describe Product do
  before(:each) do
    @product = Factory(:product)
    @valid_attrs = FactoryGirl.attributes_for(:product)
  end

  it "should create a new instance given valid attributes" do
    Product.create!(@valid_attrs)
  end

  describe "name attr" do
    it "should have a name attribute" do
      @product.should respond_to(:name)
    end

    it "is valid with valid attributes" do
      @product.should be_valid
    end

    it "is not valid w/o a name" do
      @product.name = nil
      @product.should_not be_valid
    end

    it "should reject names that are too long" do
      long_name = "a" * 51
      @product.name = long_name
      @product.should_not be_valid
    end
  end

end
