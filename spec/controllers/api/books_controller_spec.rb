require "rails_helper"

RSpec.describe Api::BooksController, type: :controller do
  render_views

  context "unauthenticated" do
    describe "GET #index" do
      let!(:book) { create(:book) }

      before :each do
        get :index, format: :json
      end

      it "responds with success" do
        expect(response).to have_http_status(200)
      end

      it "includes book" do
        expect(assigns(:books)).to include book
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end
  end
end