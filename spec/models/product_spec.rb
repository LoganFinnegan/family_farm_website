require "rails_helper"

RSpec.describe Product, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      product = Product.new(
        name: "Test Product",
        description: "A product for testing",
        price: 10.0,
        stock: 5
      )
      expect(product).to be_valid
    end

    it "is invalid without a name" do
      product = Product.new(name: nil)
      expect(product).not_to be_valid
    end

    it "is invalid without a description" do
      product = Product.new(description: nil)
      expect(product).not_to be_valid
    end

    it "is invalid with a negative price" do
      product = Product.new(price: -5)
      expect(product).not_to be_valid
    end

    it "is invalid with negative stock" do
      product = Product.new(stock: -1)
      expect(product).not_to be_valid
    end
  end

  describe "scopes" do
    before do
      @in_stock = Product.create!(name: "In Stock", description: "A valid product description", price: 5.0, stock: 2)
      @out_of_stock = Product.create!(name: "Out of Stock", description: "Another product description", price: 5.0, stock: 0)
    end

    it "returns only in-stock products" do
      expect(Product.in_stock).to include(@in_stock)
      expect(Product.in_stock).not_to include(@out_of_stock)
    end

    it "returns only out-of-stock products" do
      expect(Product.out_of_stock).to include(@out_of_stock)
      expect(Product.out_of_stock).not_to include(@in_stock)
    end
  end

  describe "#in_stock?" do
    it "returns true when stock > 0" do
      product = Product.new(stock: 3)
      expect(product.in_stock?).to be true
    end

    it "returns false when stock = 0" do
      product = Product.new(stock: 0)
      expect(product.in_stock?).to be false
    end
  end
end
