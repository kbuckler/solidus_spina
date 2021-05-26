# frozen_string_literal: true

module SolidusSpina
  module Spina
    module AdminPagesControllerDecorator
      def self.prepended(base)
        base.append_before_action :set_solidus_tabs, only: %i[new create edit update], if: :solidus_page?
        base.helper SolidusSpina::Admin::SolidusHelper
      end

      def set_solidus_tabs
        @tabs = %w[solidus]
        @tabs.prepend('page_content') unless params[:action] == 'new'
      end

      def solidus_page?
        return true if @page&.solidus_page?

        spina_resource = ::Spina::Resource.find_by(id: params[:resource_id])

        (params[:action] == 'new') &&
          (spina_resource&.name == SolidusSpina::SPINA_RESOURCE_NAME)
      end
    end

    ::Spina::Admin::PagesController.prepend AdminPagesControllerDecorator
  end
end
