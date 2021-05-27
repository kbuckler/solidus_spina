# frozen_string_literal: true

::Spina::Part.register(SolidusSpina::Parts::SolidusProduct)
::Spina::Part.register(SolidusSpina::Parts::SolidusRelatedProduct)
::Spina::Part.register(SolidusSpina::Parts::SolidusRelatedProductsRepeater)

SolidusSpina.configure do |config|
  config.spina_resource_name = 'solidus_products'
  config.spina_view_template_name = 'solidus_product'
end
