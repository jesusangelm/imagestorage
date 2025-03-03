class Admin::ItemsController < ApplicationController
  before_action :set_item, only: [ :edit, :update, :destroy ]
  before_action :set_categories, only: [ :new, :create, :edit ]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to admin_items_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to admin_items_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to admin_items_url
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end

  def item_params
    params.expect(item: [ :name, :desc, :category_id, :image ])
  end
end
