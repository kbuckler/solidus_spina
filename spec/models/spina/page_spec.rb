RSpec.describe Spina::Page do
  describe '#initialize_solidus_page' do
    let(:spina_page) { create(:page) }

    context "when associated with a spree product"
    it 'correctly initializes the page' do

      expect(spina_page).to receive(:foo)
    end
  end
end
