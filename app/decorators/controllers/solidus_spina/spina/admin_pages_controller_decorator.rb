module SolidusSpina
  module Spina
    module AdminPagesControllerDecorator
      def self.prepended(base)
        base.append_before_action :set_solidus_tabs, only: %i[new create edit update], if: :solidus_page?
        base.helper Spina::Admin::SolidusHelper
      end

      def set_solidus_tabs
        @tabs = %w[solidus]
        @tabs.prepend('page_content') unless params[:action] == 'new'
      end

      def solidus_page?
        return true if @page&.solidus_page?

        spina_resource = ::Spina::Resource.find_by(id: params[:resource_id])

        (params[:action] == 'new') &&
          (spina_resource&.name == 'solidus_products')
      end
    end

    ::Spina::Admin::PagesController.prepend AdminPagesControllerDecorator
  end
end
