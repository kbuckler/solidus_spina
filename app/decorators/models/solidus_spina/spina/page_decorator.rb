# frozen_string_literal: true

module SolidusSpina
  module Spina
    module PageDecorator
      def self.prepended(base)
        base.belongs_to :spree_product, class_name: "Spree::Product", optional: true
        base.validates :spree_product, presence: true, uniqueness: true, if: :solidus_page?
        base.before_validation :initialize_solidus_page, if: :solidus_page?, on: :create
        base.scope :solidus, -> { where.not(spree_product_id: nil) }
      end

      def solidus_page?
        spree_product_id.present? || (view_template == SolidusSpina.config.spina_view_template_name)
      end

      def initialize_solidus_page
        self.title = spree_product.name
        self.view_template = resource.view_template
        self.show_in_menu = false
      end
    end
    ::Spina::Page.prepend PageDecorator
  end
end
