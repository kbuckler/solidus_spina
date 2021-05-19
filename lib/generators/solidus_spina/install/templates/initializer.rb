# frozen_string_literal: true

SolidusSpina.configure do |config|

end

Spina::Part.register(Spina::Parts::SolidusRelatedProduct)
Spina::Part.register(Spina::Parts::SolidusProductReadonly)
Spina::Part.register(Spina::Parts::SolidusRelatedProductsRepeater)