require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before :each do
      @product = Product.new({:name => 'chair',:price => 100, :quantity => 20, :category => Category.new({:name => 'furniture'})})
      @product.save!
    end

    it "should save sucessfully" do
      expect(@product).to be_present
    end

    it "should have a name present" do
      expect(@product.name).to be_present
    end
    it "should have a price present" do
      expect(@product.price).to be_present
    end
    it "should have a quantity present" do
      expect(@product.quantity).to be_present
    end
    it "should have a category present" do
      expect(@product.category).to be_present
    end

    
  end
end
