class Admin::CategoriesController < ApplicationController
  layout "admin/layout"
  before_action :set_category, only: [ :edit, :update, :destroy ]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_url
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.expect(category: [ :name, :desc ])
  end
end
