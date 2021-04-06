require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category = Category.create(name: "test")
    end

    it 'validates product will successfully save' do
      product = Product.create(
        name: "pen",
        price: 10,
        quantity: 1,
        category: @category
      )

      expect(product).to be_valid
    end

    it 'validates presence of product name' do
      product = Product.create(
        name: nil,
        price: 50,
        quantity: 1,
        category: @category
      )
      
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include "Name can't be blank"
    end

    it 'validates presence of product Name' do
      product = Product.create(
        name: 'Hosam',
        price: 50,
        quantity: 1,
        category: @category
      )

      expect(product.name).to eq('Hosam')
    end

    it 'validates presence of product Price' do
      product = Product.create(
        name: 'Hosam',
        price: nil,
        quantity: 2,
        category: @category
      )
      
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include "Price can't be blank"
    end

    it 'validates presence of product Price' do
      product = Product.create(
        name: 'Hosam',
        price: 10,
        quantity: 1,
        category: @category
      )

      expect(product.price).to eq(10)
    end

    it 'validates presence of product Quantity' do
      product = Product.create(
        name: 'Hosam',
        price: 10,
        quantity: nil,
        category: @category
      )
      
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'validates presence of product Quantity' do
      product = Product.create(
        name: 'Hosam',
        price: 10,
        quantity: 1,
        category: @category
      )

      expect(product.quantity).to eq(1)
    end

    it 'validates presence of product Category' do
      product = Product.create(
        name: 'Hosam',
        price: 10,
        quantity: 1,
        category: nil
      )
      
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include "Category can't be blank"
    end

    it 'validates presence of product Category' do
      product = Product.create(
        name: 'Hosam',
        price: 10,
        quantity: 1,
        category: @category
      )

      expect(product.category.name).to eq('test')
    end

  end
end
