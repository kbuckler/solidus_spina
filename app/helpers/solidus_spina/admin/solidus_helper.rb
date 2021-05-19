module SolidusSpina
  module Admin
    module SolidusHelper
      def options_for_spree_product_select(include_nil: false)
        exception_list = ::Spina::Page.solidus.pluck(:spree_product_id)
        product_options = ::Spree::Product.where.not(id: exception_list).order('name ASC').pluck(:name, :id)
        include_nil ? [['(None)', nil]] + product_options : product_options
      end
    end
  end
end
