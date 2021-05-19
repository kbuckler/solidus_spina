module SolidusSpina
  module Parts
    class SolidusProductReadonly < Spina::Parts::Base
      attr_json :spree_product_id, :integer

      def content
        ::Spree::Product.find(spree_product_id)
      end

      def label
        content&.name
      end
    end
  end
end
