module Admin::ItemsHelper
  def image_link_tag_generator(item)
    item.image.attached? ? link_to(image_tag(item.image.variant(:micro)), item.image) : "No 🖼️"
  end

  def cdn_image_link_tag_generator(item)
    item.image.attached? ? link_to(image_tag(cdn_image_url(item.image.variant(:micro))), cdn_image_url(item.image)) : "No 🖼️"
  end

  def url_variants_link(item)
    if item.image.attached?
      variants = [ :mini, :micro ].map { |variant| link_to(variant, item.image.variant(variant)) }
      safe_join(variants, " ")
    else
      "No 🖼️"
    end
  end

  def cdn_url_variants_link(item)
    if item.image.attached?
      variants = [ :mini, :micro ].map { |variant| link_to(variant, cdn_image_url(item.image.variant(variant))) }
      safe_join(variants, " ")
    else
      "No 🖼️"
    end
  end
end
