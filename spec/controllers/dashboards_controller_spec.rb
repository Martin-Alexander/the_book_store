require "rails_helper"

RSpec.describe DashboardsController, type: :controller do
  render_views

  context "authenticated" do
    describe "GET #show" do
      let(:user) { create(:user) }

      before(:each) {
        sign_in(user)

        get :show
      }

      it "responds with success" do
        expect(response).to have_http_status(200)
      end

      it "sets `@user` to signed in user" do
        expect(assigns(:user)).to eq(user)
      end

      it "renders the :show template" do
        expect(response).to render_template :show
      end
    end
  end

  context "unauthenticated" do
    it "redirects to login" do
      get :show
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end