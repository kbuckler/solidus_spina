module SolidusSpina
  module SolidusProductPageHelper
    def spina_content(part_name = nil)
      ::Spina::Current.page.content(part_name)
    end

    def has_spina_content?(part_name)
      return false unless ::Spina::Current.page

      ::Spina::Current.page.has_content?(part_name)
    end

    def spina_repeater(part)
      part = ::Spina::Current.page.find_part(part)&.content unless part.is_a? Array
      part&.each do |repeater_content|
        repeater_content.view_context = self
        yield(repeater_content)
      end
    end
  end
end
