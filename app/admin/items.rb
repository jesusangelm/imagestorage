ActiveAdmin.register Item do
  permit_params :name, :desc, :category_id, :image

  index do
    selectable_column
    id_column
    column :name
    column :desc
    column :category
    column :image do |item|
      item.image.attached? ? link_to(image_tag(item.image.variant(:micro)), item.image) : 'No image'
    end
    column 'URL variants' do |item|
      item.image.attached? ? [:mini, :micro].map { |variant| link_to(variant, item.image.variant(variant)) } : 'No image'
    end
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :category
      f.input :name
      f.input :desc
      f.input :image, as: :file
    end
    f.actions
  end
end
