require "rails_helper"

RSpec.describe LandingPagesController, type: :controller do
  render_views

  describe "GET #show" do
    before(:each) { get :show }

    it "responds with success" do
      expect(response).to have_http_status(200)
    end

    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end
end