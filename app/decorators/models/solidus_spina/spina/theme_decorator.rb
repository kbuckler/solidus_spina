# frozen_string_literal: true

module SolidusSpina
  module Spina
    module ThemeDecorator
      def new_page_templates(recommended: "")
        templates = super(recommended: recommended)

        show_template = (recommended == SolidusSpina.config.spina_view_template_name)

        templates.send(show_template ? :select : :reject) do |template|
          template.name == SolidusSpina.config.spina_view_template_name
        end
      end
    end

    ::Spina::Theme.prepend ThemeDecorator
  end
end
