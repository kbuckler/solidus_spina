# frozen_string_literal: true

FactoryBot.define do
  factory :spree_product, class: 'Spree::Product' do
    name { 'Spree Product Title' }
  end
  factory :spina_resource, class: 'Spina::Resource' do
    name { "Spina Resource" }
    view_template { "view_template" }
  end
  factory :spina_page, class: 'Spina::Page' do
    title { "Spina Page A" }
    factory :spina_page_with_product do
      spree_product { build_stubbed(:spree_product) }
      resource { build_stubbed(:spina_resource) }
    end
  end
end
