# frozen_string_literal: true

module SolidusSpina
  module Spina
    module Pages
      module LocationComponentDecorator
        def resource_scope
          scope = ::Spina::Resource.all
          scope = scope.where.not(name: SolidusSpina.config.spina_resource_name) unless @page.solidus_page?
          scope.order(:label)
        end

        def resources
          [main_collection_option] + resource_scope.map do |resource|
            [resource.label, resource.id, {
              data: {
                parent_pages_url: helpers.spina.admin_parent_pages_path(resource_id: resource.id)
              }
            }]
          end
        end
      end
   
      ::Spina::Pages::LocationComponent.prepend LocationComponentDecorator
   
    end
  end
end
