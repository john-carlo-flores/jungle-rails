# Preview all emails at http://localhost:3000/rails/mailers/order
class OrderPreview < ActionMailer::Preview
  def receipt
    OrderMailer.with(user: User.first, order: Order.first).receipt
  end
end
