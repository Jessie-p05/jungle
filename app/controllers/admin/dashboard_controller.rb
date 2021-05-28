class Admin::DashboardController < ApplicationController
  def show
    @products = Product.order(id: :desc).all
    @categories = Category.all
  end
  
end
