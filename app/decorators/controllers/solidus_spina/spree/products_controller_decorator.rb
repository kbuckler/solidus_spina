# frozen_string_literal: true

module SolidusSpina
  module Spree
    module ProductsControllerDecorator
      def self.prepended(base)
        base.append_before_action :load_spina_content, only: :show
        base.helper SolidusSpina::SolidusHelper
      end

      def load_spina_content
        ::Spina::Current.page = ::Spina::Page.find_by(spree_product_id: @product.id)
      end
    end
    ::Spree::ProductsController.prepend ProductsControllerDecorator
  end
end
