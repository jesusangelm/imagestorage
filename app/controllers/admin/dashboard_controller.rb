class Admin::DashboardController < ApplicationController
  def index
    @total_categories = Category.count
    @total_items = Item.count
  end
end
