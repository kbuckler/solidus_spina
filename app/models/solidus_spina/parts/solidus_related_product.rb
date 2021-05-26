# frozen_string_literal: true

module SolidusSpina
  module Parts
    class SolidusRelatedProduct < ::Spina::Parts::Base
      attr_json :spree_relation_id, :integer

      def content
        return unless spree_relation_id

        ::Spree::Relation.find(spree_relation_id)
      end

      def label
        return '(None)' unless content

        "#{content.relation_type.name} - #{content.related_to.name}"
      end
    end
  end
end
