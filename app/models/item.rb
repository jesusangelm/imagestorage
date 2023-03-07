class Item < ApplicationRecord
  belongs_to :category

  has_one_attached :image do |img|
    img.variant(:micro, resize_to_limit: [100, 100])
    img.variant(:mini, resize_to_limit: [350, 350])
  end

  validates :name, presence: true
end
