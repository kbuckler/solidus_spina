# frozen_string_literal: true

module SolidusSpina
  module SolidusHelper
    def spina_content(part_name = nil)
      ::Spina::Current.page.content(part_name)
    end

    def spina_content?(part_name)
      return false unless ::Spina::Current.page

      ::Spina::Current.page.has_content?(part_name)
    end

    def spina_repeater(part, limit: nil)
      part = ::Spina::Current.page.find_part(part)&.content unless part.is_a? Array
      part&.each_with_index do |repeater_content, index|
        break if limit && index == limit

        repeater_content.view_context = self
        yield(repeater_content)
      end
    end
  end
end
