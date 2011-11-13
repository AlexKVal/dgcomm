require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success        
    end
    
    it "should return list of products" do
      prod1 = Factory(:product)
      prod2 = Factory(:product)
      Product.stub(:all).and_return([prod1, prod2])
      
      get :index
      assigns(:products).should include prod1
      assigns(:products).should include prod2
    end
  end

end
