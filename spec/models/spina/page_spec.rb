RSpec.describe Spina::Page do
  describe '#initialize_solidus_page' do
    let(:spina_page) { create(:spina_page_with_product) }

    context "when associated with a spree product" do
      it 'correctly initializes the page title' do
        expect(spina_page.title).to eq('Spree Product Title')
      end

      it 'inherits the view template from the spina resource' do
        expect(spina_page.view_template).to eq('view_template')
      end
    end
  end
end
