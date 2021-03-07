require "rails_helper"

RSpec.describe Api::BookStocksController, type: :controller do
  render_views

  describe "GET #index" do
    let!(:user)                 { create(:user)}
    let!(:users_book_stock)     { create(:book_stock, { book_store: user.book_store }) }
    let!(:not_users_book_stock) { create(:book_stock) }

    before :each do
      set_auth_token_header(user)

      get :index, format: :json
    end

    it "returns a 200 status code" do
      expect(response).to have_http_status(200)
    end

    it "includes user's book_stock in response" do
      expect(assigns(:book_stocks)).to include users_book_stock
    end

    it "does not include unpublished in jobs" do
      expect(assigns(:book_stocks)).not_to include not_users_book_stock
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end

  describe "POST #create" do
    let(:user) { create(:user)}

    context "with valid params" do
      before(:each) { set_auth_token_header(user) }

      let(:valid_params) {
        {
          book_stock: {
            book_id: create(:book).id,
            stock_level: 10,
            in_stock: true
          }
        }
      }

      let(:request) { post :create, format: :json, params: valid_params }

      it "responds with success" do
        expect(request).to have_http_status(200)
      end

      it "creates the book stock" do
        expect { request }.to change(BookStock, :count).by(1)
      end

      it "assigns the given params and sets the book_store_id to the users book store" do
        request
        last_book_stock = BookStock.last

        expect(last_book_stock.book_id)      .to eq(valid_params[:book_stock][:book_id])
        expect(last_book_stock.stock_level)  .to eq(valid_params[:book_stock][:stock_level])
        expect(last_book_stock.in_stock)     .to eq(valid_params[:book_stock][:in_stock])
        expect(last_book_stock.book_store_id).to eq(user.book_store_id)
      end

      it "renders show template" do
        expect(request).to render_template :show
      end
    end

    context "with invalid params" do
      before(:each) { set_auth_token_header(user) }

      let(:invalid_params) {
        {
          book_stock: {
            book_id: create(:book).id,
            stock_level: nil,
            in_stock: nil
          }
        }
      }

      let(:request) { post :create, format: :json, params: invalid_params }

      it "responds with unprocessable entity" do
        expect(request).to have_http_status(422)
      end

      it "does not create a book stock" do
        expect { request }.to change(BookStock, :count).by(0)
      end
    end
  end

  describe "PATCH #update" do
    let(:user)          { create(:user) }
    let(:my_book_stock) { create(:book_stock, book_store: user.book_store) }

    context "with valid params" do
      before(:each) { set_auth_token_header(user) }

      let(:valid_params) {
        {
          id: my_book_stock.id,
          book_stock: {
            book_id: create(:book).id,
            stock_level: 20,
            in_stock: false
          }
        }
      }

      let(:request) { patch :update, format: :json, params: valid_params }

      it "responds with success" do
        expect(request).to have_http_status(200)
      end

      it "updates attrbiutes" do
        request

        my_book_stock.reload

        expect(my_book_stock.book_id)      .to eq(valid_params[:book_stock][:book_id])
        expect(my_book_stock.stock_level)  .to eq(valid_params[:book_stock][:stock_level])
        expect(my_book_stock.in_stock)     .to eq(valid_params[:book_stock][:in_stock])
      end

      it "renders show template" do
        expect(request).to render_template :show
      end
    end

    context "with invalid params" do
      before(:each) { set_auth_token_header(user) }

      let(:invalid_params) {
        {
          id: my_book_stock.id,
          book_stock: {
            stock_level: -20,
            in_stock: false
          }
        }
      }

      let(:request) { patch :update, format: :json, params: invalid_params }

      it "responds with unprocessable entity" do
        expect(request).to have_http_status(422)
      end

      it "does not change the book stock" do
        expect { request }
          .to not_change(my_book_stock, :stock_level)
          .and not_change(my_book_stock, :in_stock)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:user)           { create(:user) }
    let!(:my_book_stock) { create(:book_stock, book_store: user.book_store) }

    context "with valid params" do
      before(:each) { set_auth_token_header(user) }

      it "responds with success" do
        expect(delete :destroy, format: :json, params: { id: my_book_stock.id }).to have_http_status(200)
      end

      it "deletes the book stock" do
        expect do
          delete :destroy, format: :json, params: { id: my_book_stock.id }
        end.to change(BookStock, :count).by(-1)
      end
    end
  end
end