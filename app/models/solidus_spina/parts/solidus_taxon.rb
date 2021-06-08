module SolidusSpina
  module Parts
    class SolidusTaxon < ::Spina::Parts::Base
      attr_json :spree_taxon_id, :integer

      def content
        ::Spree::Taxon.find(spree_taxon_id)
      end

      def label
        content&.pretty_name
      end
    end
  end
end
