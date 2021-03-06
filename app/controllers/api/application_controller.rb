module Api
  class ApplicationController < ActionController::API
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :respond_with_forbidden

    private

    def respond_with_forbidden
      render json: { message: "forbidden" }, status: :forbidden
    end
  end
end