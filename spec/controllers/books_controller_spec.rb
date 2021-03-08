require "rails_helper"

RSpec.describe BooksController, type: :controller do
  render_views

  context "authenticated" do
    describe "GET #index" do
      let!(:user) { create(:user) }

      before(:each) {
        sign_in(user)

        get :index
      }

      it "responds with success" do
        expect(response).to have_http_status(200)
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end
  end

  context "unauthenticated" do
    it "redirects to login" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end