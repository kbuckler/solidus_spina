module SolidusSpina
  module Spina
    module PageDecorator
      def self.prepended(base)
        base.validates :spree_product_id, presence: true, uniqueness: true, allow_nil: true
        base.before_validation :initialize_solidus_page, if: :solidus_page?, on: :create
        base.scope :solidus, -> { where.not(spree_product_id: nil) }
      end

      def solidus_page?
        spree_product_id.present?
      end

      def initialize_solidus_page
        self.title = solidus_product.name
        self.view_template = resource.view_template
        self.show_in_menu = false
      end

      def solidus_product
        @solidus_product ||= ::Spree::Product.find_by(id: spree_product_id)
      end
    end

    ::Spina::Page.prepend PageDecorator
  end
end
