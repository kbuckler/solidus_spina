Mobility.configure do
  plugins do
    backend :table
    active_record
    reader
    writer
    backend_reader
    query
    cache
    presence
    fallbacks false # default to false, enable if passed fallbacks: true
    default
  end
end

::Spina::Theme.register do |theme|
  theme.name = 'default'
  theme.title = 'Test Theme'

  theme.parts = [
    {
      name: 'product',
      title: 'Product',
      part_type: 'SolidusSpina::Parts::SolidusProduct'
    },
    {
      name: 'solidus_related_product',
      title: 'Related Product',
      part_type: 'SolidusSpina::Parts::SolidusRelatedProduct'
    },
    {
      name: 'related_products',
      title: 'Related Products',
      parts: %w[solidus_related_product text image],
      part_type: 'SolidusSpina::Parts::SolidusRelatedProductsRepeater'
    },
    {
      name: 'featured_products',
      title: 'Featured Products',
      parts: %w[product],
      part_type: 'Spina::Parts::Repeater'
    },
  ]

  theme.view_templates = [
    {
      name: 'solidus_product',
      title: 'Solidus Product',
      parts: %w[related_products]
    }
  ]

  theme.custom_pages = [{
    name: 'homepage',
    title: 'Homepage',
    deletable: false,
    view_template: 'homepage'
  }]

  theme.navigations = [{
    name: 'main',
    label: 'Main navigation',
    auto_add_pages: true
  }]

  theme.resources = [{
    name: 'solidus_products',
    label: 'Solidus Products',
    view_template: 'solidus_product'
  }]
end
