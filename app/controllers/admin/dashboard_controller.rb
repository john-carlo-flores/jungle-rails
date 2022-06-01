class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  def show
    @products_count = Product.all.length
    @categories_count = Category.all.length
    @orders_count = Order.all.length
    @line_items_count = LineItem.all.length
  end
end
