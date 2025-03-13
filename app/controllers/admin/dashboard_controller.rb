class Admin::DashboardController < ApplicationController
  layout "admin/layout"
  def index
    @total_categories = Category.count
    @total_items = Item.count
    @total_users = User.count
    @total_attachments = ActiveStorage::Attachment.count
  end
end
