require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      # Setup category to s
      @category = Category.find_or_create_by(name: 'Succulent')

      # Setup at least two products with different quantities, names, etc
      @product1 = Product.create!({
        name:  'Giant Tea',
        category: @category,
        description: "The Giant Tea's description",
        image: 'plant_1.jpg',
        quantity: 3,
        price: 64.99
      })
      @product2 = Product.create!({
        name:  'Scented Blade',
        category: @category,
        description: "The Scented Blade's description",
        image: 'plant_2.jpg',
        quantity: 18,
        price: 24.99
      })
      # Setup at least one product that will NOT be in the order
      @product3 = Product.create!({
        name:  'Bone Coneflower',
        category: @category,
        description: "The Bone Coneflower's description",
        image: 'plant_3.jpg',
        quantity: 8,
        price: 24.99
      })
    end

    it 'deducts quantity from products based on their line item quantities' do
      # 1. initialize order with necessary fields
      @order = Order.new({
        email: "email@email.com",
        total_cents: 0,
        stripe_charge_id: "test-stripe-id"
      })

      # 2. build line items on @order
      @order.line_items.new(
        product: @product1,
        quantity: 2,
        item_price: @product1.price,
        total_price: @product1.price * 2
      )

      @order.line_items.new(
        product: @product2,
        quantity: 4,
        item_price: @product2.price,
        total_price: @product2.price * 4
      )

      # 3.
      @order.save!
      
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload

      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eq(1)
      expect(@product2.quantity).to eq(14)
    end

    it 'does not deduct quantity from products that are not in the order' do
      # 1. initialize order with necessary fields
      @order = Order.new({
        email: "email@email.com",
        total_cents: 0,
        stripe_charge_id: "test-stripe-id"
      })

      # 2. build line items on @order
      @order.line_items.new(
        product: @product1,
        quantity: 2,
        item_price: @product1.price,
        total_price: @product1.price * 2
      )

      @order.line_items.new(
        product: @product2,
        quantity: 4,
        item_price: @product2.price,
        total_price: @product2.price * 4
      )
      
      # 3.
      @order.save!

      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      @product3.reload

      # 5. Confirm that product 3 was not affected by order created with product 1 and 2
      expect(@product3.quantity).to eq(8)
    end
  end
end
