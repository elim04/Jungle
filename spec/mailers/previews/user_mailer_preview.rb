# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def order_confirmation
    product = Product.new(
      name: 'Bubly Water - Grapefruit',
      description: 'get all da bubbles from bubly',
      price_cents: 1200,
      quantity: 1,
      category_id: 1,
      image: 'test.png'
    )
    
    quantity = 2
    
    order = Order.create(
      total_cents: 1000, 
      stripe_charge_id: 1, 
      email: 'emily@gmail.com'
    )

    order.line_items.new(
      product: product,
      quantity: quantity,
      item_price: product.price,
      total_price: product.price * quantity
    )

    UserMailer.order_confirmation(order)
  end

  
end
