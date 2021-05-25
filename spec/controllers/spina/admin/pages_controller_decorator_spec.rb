RSpec.describe ::Spina::Admin::PagesController do
  describe '#new' do
    context 'when creating a Solidus page' do
      before do
        current_user = build_stubbed(:user, spree_roles: [Spree::Role.new(name: "admin")])
        current_account = build_stubbed(:spina_account)
        allow(controller).to receive(:current_user) { current_user }
        allow(controller).to receive(:current_account).and_return( current_account )
        allow(controller).to receive(:current_theme).and_return(current_account.theme)
      end

      it 'returns successfully' do
        get :new, params: { use_route: "/spina/admin/pages", resource_id: create(:spina_resource_solidus).id }
        expect(response.status).to eq(200)
      end

      it 'contains the right tabs' do
        get :new, params: { use_route: "/spina/admin/pages", resource_id: create(:spina_resource_solidus).id }
        expect(controller.view_assigns["tabs"]).to eq(["solidus"])
      end
    end
  end
end
