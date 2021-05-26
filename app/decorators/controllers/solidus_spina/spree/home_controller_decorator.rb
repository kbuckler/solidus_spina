# frozen_string_literal: true

module SolidusSpina
  module Spree
    module HomeControllerDecorator
      def self.prepended(base)
        base.append_before_action :load_spina_content, only: :index
        base.helper SolidusSpina::SolidusHelper
      end

      def load_spina_content
        ::Spina::Current.page = ::Spina::Page.find_by(name: 'homepage')
      end
    end
    ::Spree::HomeController.prepend HomeControllerDecorator
  end
end
