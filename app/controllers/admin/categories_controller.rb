class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @categories = Category.new(categories_params)

    if @categories.save
      redirect_to [:admin, :categories], notice: 'categories created!'
    else
      render :new
    end
  end


  private

  def categories_params
    params.require(:category).permit(
      :name,
      :category_id
    )
  end
end
