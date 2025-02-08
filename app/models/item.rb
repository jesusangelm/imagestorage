class Item < ApplicationRecord
  belongs_to :category
  validates :name, presence: true

  has_one_attached :image do |img|
    img.variant(:micro, resize_to_limit: [ 160, 160 ])
    img.variant(:mini, resize_to_limit: [ 350, 350 ])
  end
end
