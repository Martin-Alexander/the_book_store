require "rails_helper"

RSpec.describe DashboardsController, type: :controller do
  render_views

  context "authenticated" do
    describe "GET #show" do
      let!(:user)              { create(:user) }
      let!(:my_book_stock)     { create(:book_stock, book_store: user.book_store) }
      let!(:not_my_book_stock) { create(:book_stock) }

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

      it "user's book stocks are included in `@book_stocks`" do
        expect(assigns(:book_stocks)).to include(my_book_stock)
      end

      it "other user's book stocks are not included in `@book_stocks`" do
        expect(assigns(:book_stocks)).to_not include(not_my_book_stock)
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