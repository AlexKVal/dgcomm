require 'spec_helper'

describe ProductsController do

  describe "GET 'show'" do
    before(:each) do
      @product = Factory(:product)
    end
    
    it "should be successful" do
      get :show, :id => @product
      response.should be_success
    end
    
    it "should return product" do
      Product.stub(:find).and_return(@product)
      
      get :show, :id => @product
      assigns(:product).name.should == @product.name
      assigns(:product).description.should == @product.description
    end
  end

end
