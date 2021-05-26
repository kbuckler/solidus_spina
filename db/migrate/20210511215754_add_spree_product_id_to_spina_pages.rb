class AddSpreeProductIdToSpinaPages < ActiveRecord::Migration[6.0]
  def change
    add_column :spina_pages, :spree_product_id, :integer, default: nil
  end
end
