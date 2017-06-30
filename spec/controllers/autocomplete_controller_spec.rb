require "rails_helper"

RSpec.describe AutocompleteController, type: :controller do
  describe "GET #index" do
    it "redirect to autocomplete" do
      get :index, format: :json
      expect(response).to have_http_status(200)
    end
  end
end
